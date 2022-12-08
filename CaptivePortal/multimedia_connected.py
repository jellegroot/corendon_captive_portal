from flask import Blueprint, render_template

mediapage_con = Blueprint('mediapage_connected', __name__)
@mediapage_con.route('/mediacon')

def media_co():
    return render_template("Multimediapage_connected.html")