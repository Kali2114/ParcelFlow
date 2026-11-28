import flask
import pymysql
import os

from dotenv import load_dotenv

from db import get_connection

load_dotenv()

app = flask.Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY")


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


@app.route("/customers")
def list_customers():
    connection = get_connection()
    with connection.cursor() as cursor:
        cursor.execute("""SELECT customer_id, customer_type, name,
        nip, email, phone, city FROM customers ORDER BY name""")
        data = cursor.fetchall()
    connection.close()
    return flask.render_template("customers.html", customers=data)


@app.route("/customers/new", methods=["GET", "POST"])
def add_customer():
    if flask.request.method == "POST":
        name = flask.request.form.get("name")
        customer_type = flask.request.form.get("customer_type")
        email = flask.request.form.get("email")
        phone = flask.request.form.get("phone")
        nip = flask.request.form.get("nip").strip() or None
        street = flask.request.form.get("street")
        city = flask.request.form.get("city")
        postal_code = flask.request.form.get("postal_code")
        connection = get_connection()
        with connection.cursor() as cursor:
            try:
                cursor.execute(
                    """INSERT INTO customers (name, customer_type, email,
                phone, nip, street, city, postal_code)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)""",
                    (name, customer_type, email, phone, nip, street, city, postal_code),
                )
                flask.flash("Customer successfully added", "success")
                connection.commit()
            except pymysql.err.IntegrityError:
                flask.flash("Customer already exists", "error")
            except pymysql.err.OperationalError:
                flask.flash(
                    "Persons can't have a NIP, companies must have one",
                    "error",
                )
            finally:
                connection.close()
        return flask.redirect("/customers")
    return flask.render_template("customer_form.html")
