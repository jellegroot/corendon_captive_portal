from flask import Blueprint, render_template, redirect, request

homepage = Blueprint('homepage', __name__)

@homepage.route('/home', methods=['POST', 'GET'])
def home():
    if request.method == 'POST': 
        return render_template("Homepage.html")
    
    if request.method == 'GET':
        return render_template("Landingpage.html")
