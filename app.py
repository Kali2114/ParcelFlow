import flask
from db import get_connection

app = flask.Flask(__name__)


@app.route("/")
def index():
    return "Hello World"


@app.route("/facilities")
def list_facilities():
    connection = get_connection()
    with connection.cursor() as cursor:
        cursor.execute("select * from facilities")
        data = cursor.fetchall()
    connection.close()
    return flask.render_template("facilities.html", facilities=data)
