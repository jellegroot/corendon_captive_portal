from flask import Blueprint, render_template

mediapage_discon = Blueprint('mediapage_disconnected', __name__)
@mediapage_discon.route('/')

def media_disconnected():
    return render_template("Multimediapage_disconnected.html")