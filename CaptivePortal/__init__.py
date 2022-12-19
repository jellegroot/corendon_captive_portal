from flask import Flask

app = Flask(__name__)
@app.route('/')
app.config['SECRET_KEY'] ='key'
def create_app():
    
    

    from .homepage import homepage
    from .landingpage import landing
    from .multimedia_connected import mediapage_con
    from .multimedia_disconnected import mediapage_discon

    app.register_blueprint(homepage, url_prefix='/')
    app.register_blueprint(landing, url_prefix='/')
    app.register_blueprint(mediapage_con, url_prefix='/')
    app.register_blueprint(mediapage_discon, url_prefix='/')
    return app
