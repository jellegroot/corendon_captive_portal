from flask import Blueprint, render_template, request, redirect, url_for
import sys
import mysql.connector as dbconnector



landing = Blueprint('landing', __name__)
@landing.route('/', methods=['POST', 'GET'])

def landingpage():
    if request.method == 'POST':
        db = connect_to_db()

        seatid = request.form['uSeatnumber']
        lastname = request.form['uLastName']

        dbcursor = db.cursor()

        sql = "SELECT * FROM Passenger WHERE seatid = %s AND lastname = %s"
        data = (seatid, lastname)

        dbcursor.execute(sql,data)

        myresult = dbcursor.fetchall()

        print(f"Login attempt with seatid:{seatid} and lastname:{lastname} with result:{myresult}", file=sys.stdout)
        db.close()
        if myresult != []:
            # give internet acces bitch
            return redirect(url_for('homepage.home'))
        else:
            print()
            # throw error

    return render_template("Landingpage.html")

def connect_to_db():
    mydb = dbconnector.connect(
    host="localhost",
    user="Flask",
    password="watisbeveiliging",
    database="fysdb"
    )
    print(mydb, file=sys.stdout)
    return mydb


