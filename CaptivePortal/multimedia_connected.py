from flask import Blueprint, render_template, request

mediapage_con = Blueprint('mediapage_connected', __name__)
@mediapage_con.route('/mediapage:status-online')

def media_co():
    if request.method == 'POST':
        return render_template("Multimediapage_connected.html")
    
    if request.method == 'GET':
        return render_template("Landingpage.html")