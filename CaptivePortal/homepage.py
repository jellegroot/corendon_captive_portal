from flask import Blueprint, render_template

homepage = Blueprint('homepage', __name__)

@homepage.route('/home', methods=['POST', 'GET'])
def home():
    return render_template("Homepage.html")
