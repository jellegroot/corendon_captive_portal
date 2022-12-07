from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] ='key'

    from .homepage import homepages
    from .landingpage import landing
    from .multimedia_connected import mediapage_con
    from .multimedia_disconnected import mediapage_discon

    app.register_blueprint(homepages, url_prefix='/')
    app.register_blueprint(landing, url_prefix='/')
    app.register_blueprint(mediapage_con, url_prefix='/')
    app.register_blueprint(mediapage_discon, url_prefix='/')
    return app