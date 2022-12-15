from flask import Blueprint, render_template

mediapage_discon = Blueprint('mediapage_disconnected', __name__)
@mediapage_discon.route('/mediapage:status-offline')

def media_disco():
    return render_template("Multimediapage_disconnected.html")