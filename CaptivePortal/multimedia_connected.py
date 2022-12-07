from flask import Blueprint, render_template

mediapage_con = Blueprint('mediapage_connected', __name__)
@mediapage_con.route('/')

def media_connected():
    return render_template("Multimediapage_connected.html")