import os
import pymysql
from dotenv import load_dotenv

load_dotenv()


def get_connection():
    return pymysql.connect(
        host=os.getenv("APP_DB_HOST"),
        port=int(os.getenv("APP_DB_PORT")),
        user=os.getenv("APP_DB_USER"),
        password=os.getenv("APP_DB_PASSWORD"),
        database=os.getenv("APP_DB_NAME"),
        cursorclass=pymysql.cursors.DictCursor,
    )
