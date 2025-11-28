import streamlit as st
import pandas as pd
from sqlalchemy import create_engine
from langchain_community.utilities import SQLDatabase
from langchain_community.llms import Ollama
from langchain_openai import ChatOpenAI
from io import BytesIO
from dotenv import load_dotenv
import os
load_dotenv()

# ------------ PAGE CONFIG ------------
st.set_page_config(page_title="💬 SQL Chat", page_icon="💬", layout="wide")
st.title("💬 SQL Chat with MySQL")

os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
# Langsmith Tracing
# os.environ["LANGCHAIN_API_KEY"] = os.getenv("LANGCHAIN_API_KEY")
# os.environ["LANGSMITH_TRACING"] = "true"
# os.environ["LANGCHAIN_PROJECT"] = os.getenv("LANGCHAIN_PROJECT")


# ------------ SIDEBAR DB INPUT ------------
st.sidebar.header("🔌 MySQL Connection")

mysql_host = st.sidebar.text_input("MySQL Host", "")
mysql_user = st.sidebar.text_input("MySQL User", "")
mysql_password = st.sidebar.text_input("MySQL Password", "", type="password")
mysql_db = st.sidebar.text_input("MySQL Database Name", "")

if not all([mysql_host, mysql_user, mysql_password, mysql_db]):
    st.warning("⚠️ Enter all MySQL connection details.")
    st.stop()

# ------------ DB CONNECTION ------------
@st.cache_resource
def connect_mysql():
    try:
        # engine = create_engine(
        #     f"mysql+mysqlconnector://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}"
        # )
        engine = create_engine(
            f"mysql+pymysql://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}"
        )
        return SQLDatabase(engine)
    except Exception as e:
        st.error(f"❌ MySQL Connection Error: {e}")
        return None


db = connect_mysql()
if not db:
    st.stop()
else:
    st.success("🟢 Connected Successfully")


# ------------ LLM ------------
# llm = Ollama(model="llama3")
llm = ChatOpenAI(model="gpt-4o-mini", temperature=0.2)

def clean_sql(raw_sql: str):
    sql = raw_sql.strip()

    sql = sql.replace("```sql", "")
    sql = sql.replace("```", "")

    sql = sql.replace("undefined", "")

    return sql.strip()

def nl_to_sql(question, schema_info):
    prompt = f"""
        You are a MySQL expert.
        Convert the user question into a valid SELECT SQL query.

        Rules:
        - Return ONLY SQL (no explanation)
        - MySQL compatible
        - Use existing schema only

        Schema:
        {schema_info}

        User Question:
        {question}
    """
    response = llm.invoke(prompt)
    return response.content.strip()


def run_query(query: str):
    try:
        engine = create_engine(
            f"mysql+mysqlconnector://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}"
        )
        return pd.read_sql(query, engine)
    except Exception as e:
        return str(e)


# ------------ SESSION STATE ------------
if "messages" not in st.session_state or st.sidebar.button("🧹 Clear Chat"):
    st.session_state.messages = [
        {"role": "assistant", "type": "text", "value": "👋 Ask me anything about your database."}
    ]
    st.session_state.df_history = []


# ------------ RENDER CHAT HISTORY ------------
for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):

        if msg["type"] == "text":
            st.markdown(msg["value"])

        elif msg["type"] == "sql_block":
            st.markdown(msg["value"])

        elif msg["type"] == "table":
            df = st.session_state.df_history[msg["df_index"]]

            with st.container(border=False):
                st.dataframe(df, use_container_width=True)

                col1, col2 = st.columns(2)

                # CSV download
                csv_data = df.to_csv(index=False).encode("utf-8")
                col1.download_button(
                    "📥 CSV",
                    csv_data,
                    file_name=f"query_results_{msg['df_index']}.csv",
                    mime="text/csv",
                    key=f"csv_{msg['df_index']}"
                )

                # Excel download
                buf = BytesIO()
                with pd.ExcelWriter(buf, engine="openpyxl") as writer:
                    df.to_excel(writer, sheet_name="Results", index=False)
                buf.seek(0)

                col2.download_button(
                    "📥 Excel",
                    buf,
                    file_name=f"query_results_{msg['df_index']}.xlsx",
                    mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    key=f"excel_{msg['df_index']}"
                )


# ------------ USER INPUT ------------
user_query = st.chat_input("Enter your query...")

if user_query:
    st.session_state.messages.append({"role": "user", "type": "text", "value": user_query})
    st.chat_message("user").write(user_query)

    with st.chat_message("assistant"):
        schema = db.get_table_info()
        raw_sql = nl_to_sql(user_query, schema)
        sql_query = clean_sql(raw_sql)

        # Show SQL
        sql_text = f"### 📝 Generated SQL Query\n```sql\n{sql_query}\n```"
        st.markdown(sql_text)

        # Save SQL section
        st.session_state.messages.append({"role": "assistant", "type": "sql_block", "value": sql_text})

        # Execute SQL
        result = run_query(sql_query)

        if isinstance(result, str):
            st.error(result)
            st.session_state.messages.append({"role": "assistant", "type": "text", "value": "❌ SQL Error\n" + result})

        else:
            df = pd.DataFrame(result)
            st.session_state.df_history.append(df)
            df_index = len(st.session_state.df_history) - 1

            st.success("📊 Query Returned Data")

            with st.container(border=False):
                st.dataframe(df, use_container_width=True)

            col1, col2 = st.columns(2)

            # CSV download
            csv_data = df.to_csv(index=False).encode("utf-8")
            col1.download_button(
                "📥 CSV",
                csv_data,
                file_name=f"query_results_{df_index}.csv",
                mime="text/csv",
                key=f"csv_{df_index}"
            )

            # Excel download
            buf = BytesIO()
            with pd.ExcelWriter(buf, engine="openpyxl") as writer:
                df.to_excel(writer, sheet_name="Results", index=False)
            buf.seek(0)

            col2.download_button(
                "📥 Excel",
                buf,
                file_name=f"query_results_{df_index}.xlsx",
                mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                key=f"excel_{df_index}"
            )

            # Save table reference
            st.session_state.messages.append({
                "role": "assistant",
                "type": "table",
                "df_index": df_index
            })


# ------------ SHOW TABLE NAMES ------------
with st.expander("📚 Show Tables in DB"):
    try:
        st.write(db.get_usable_table_names())
    except:
        st.write("⚠️ Unable to load table list")
