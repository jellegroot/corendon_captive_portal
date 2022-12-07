from flask import Blueprint, render_template, request



landing = Blueprint('landing', __name__)
@landing.route('/', methods=['POST', 'GET'])

def landingpage():
    return render_template("Landingpage.html")
