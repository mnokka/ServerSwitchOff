from flask import Flask, render_template
import os
import sys
import logging
from logging.handlers import RotatingFileHandler

app = Flask(__name__)

LOGFILE='/shared/ShutApp.log'
MESSAGEFILE='/shared/SHUTSHUT'

logging.basicConfig(filename=LOGFILE, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)

@app.route('/')
def index():
    print("--- Hello, World! ----- Hajaantukaa täällä ei ole mitään nähtävää!! ----")
    app.logger.info('Hello World page printed (/)')
    return render_template('index.html')

@app.route('/shutdown', methods=['POST'])
def shutdown():

    with open(MESSAGEFILE, 'w') as f:
        f.write('Shutdown initiated to messagefile')
        app.logger.info('Host shutting down request initiated to messagefile ...')
        return 'Host shutting down has bee requested...'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


