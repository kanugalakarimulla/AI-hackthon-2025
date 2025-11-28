import streamlit as st
from pathlib import Path
from langchain_classic.agents import create_sql_agent, AgentType
from langchain_classic.sql_database import SQLDatabase
from langchain_classic.agents.agent_toolkits import SQLDatabaseToolkit
from langchain_community.llms import Ollama
from langchain_openai import ChatOpenAI
from sqlalchemy import create_engine
import sqlite3
from langchain_groq import ChatGroq
from langchain_classic.callbacks import StreamlitCallbackHandler
from dotenv import load_dotenv
import os
load_dotenv()

os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
# Langsmith Tracing
os.environ["LANGCHAIN_API_KEY"] = os.getenv("LANGCHAIN_API_KEY")
os.environ["LANGSMITH_TRACING"] = "true"
os.environ["LANGCHAIN_PROJECT"] = os.getenv("LANGCHAIN_PROJECT")


st.set_page_config(page_title="💬 LangChain - Chat with SQL DB", page_icon="💬")
st.title("💬 LangChain - Chat with SQL DB")


# -----------------------------------------------------------
# Sidebar Inputs
# -----------------------------------------------------------
st.sidebar.header("MySQL Connection")

mysql_host = st.sidebar.text_input("MySQL Host", "localhost:3306")
mysql_user = st.sidebar.text_input("MySQL User", "")
mysql_password = st.sidebar.text_input("MySQL Password", "", type="password")
mysql_db = st.sidebar.text_input("MySQL Database Name", "")

if not all([mysql_host, mysql_user, mysql_password, mysql_db]):
    st.warning("⚠️ Enter all MySQL connection details.")
    st.stop()


# -----------------------------------------------------------
# Connect to MySQL
# -----------------------------------------------------------
@st.cache_resource
def connect_mysql():
    try:
        engine = create_engine(
            f"mysql+mysqlconnector://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}"
        )
        return SQLDatabase(engine)
    except Exception as e:
        st.error(f"❌ MySQL Connection Error: {e}")
        return None



db = connect_mysql()
if not db:
    st.stop()
else:
    st.success("✅ Connected to MySQL Database")


# -----------------------------------------------------------
# LLM Initialization
# -----------------------------------------------------------
# llm = Ollama(model="llama3")

llm = ChatOpenAI(model="gpt-4o-mini", temperature=0.2)


# toolkit
toolkit = SQLDatabaseToolkit(db=db, llm=llm)

agent = create_sql_agent(
    llm=llm,
    toolkit=toolkit,
    verbose=True,
    agent_type=AgentType.OPENAI_FUNCTIONS,
    # agent_type=AgentType.ZERO_SHOT_REACT_DESCRIPTION,
)

if "messages" not in st.session_state or st.sidebar.button("Clear Conversation"):
    st.session_state["messages"] = [
        {
            "role": "assistant",
            "content": "Hi, I'm a chatbot who can answer questions about the Student database. How can I help you?",
        }
    ]

for msg in st.session_state["messages"]:
    st.chat_message(msg["role"]).write(msg["content"])

user_query = st.chat_input("Ask me about the Student database")

if user_query:
    st.session_state["messages"].append({"role": "user", "content": user_query})
    st.chat_message("user").write(user_query)

    with st.chat_message("assistant"):
        streamlit_callback = StreamlitCallbackHandler(st.container())
        response = agent.run(user_query, callbacks=[streamlit_callback])
        st.session_state["messages"].append({"role": "assistant", "content": response})
        st.write(response)

# Show me all the records from the table
# get 2 records from users and display in table

