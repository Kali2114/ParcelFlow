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


def get_customer_form_data():
    form = flask.request.form
    return (
        form.get("name"),
        form.get("customer_type"),
        form.get("email"),
        form.get("phone"),
        form.get("nip").strip() or None,
        form.get("street"),
        form.get("city"),
        form.get("postal_code"),
    )


def save_customer(sql, params, success_message):
    connection = get_connection()
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, params)
        connection.commit()
        flask.flash(success_message, "success")
    except pymysql.err.IntegrityError:
        flask.flash("A customer with this email or NIP already exists", "error")
    except pymysql.err.OperationalError:
        flask.flash("Persons can't have a NIP, companies must have one", "error")
    finally:
        connection.close()


@app.route("/customers/new", methods=["GET", "POST"])
def add_customer():
    if flask.request.method == "POST":
        save_customer(
            """INSERT INTO customers (name, customer_type, email,
            phone, nip, street, city, postal_code)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)""",
            get_customer_form_data(),
            "Customer successfully added",
        )
        return flask.redirect(flask.url_for("list_customers"))
    return flask.render_template("customer_form.html")


@app.route("/customers/<int:customer_id>/edit", methods=["GET", "POST"])
def edit_customer(customer_id):
    if flask.request.method == "POST":
        save_customer(
            """UPDATE customers SET name = %s, customer_type = %s, email = %s,
            phone = %s, nip = %s, street = %s, city = %s, postal_code = %s
            WHERE customer_id = %s""",
            get_customer_form_data() + (customer_id,),
            "Customer successfully updated",
        )
        return flask.redirect(flask.url_for("list_customers"))

    connection = get_connection()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM customers WHERE customer_id = %s", (customer_id,))
        customer = cursor.fetchone()
    connection.close()
    if customer is None:
        flask.abort(404)
    return flask.render_template("customer_form.html", customer=customer)
