from flask import Blueprint, render_template

homepages = Blueprint('homepages', __name__)

@homepages.route('/', methods=['GET', 'POST'])
def home():
    return render_template("Homepage.html")
