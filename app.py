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
        cursor.execute("""SELECT f.facility_id, f.name, f.facility_type,
         f.street, f.postal_code, f.city, h.name AS hub_name
         FROM facilities f
         LEFT JOIN facilities h ON f.hub_id = h.facility_id""")
        data = cursor.fetchall()
    connection.close()
    return flask.render_template("facilities.html", facilities=data)
