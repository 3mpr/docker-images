from flask import Flask, render_template
import jinja2

application = Flask(__name__)
application.jinja_loader = jinja2.FileSystemLoader("/usr/src/gestalt/views")


@application.route('/')
def index():
    return render_template('index.html')


if __name__ == "__main__":

    application.run()
