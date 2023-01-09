
from elasticsearch import Elasticsearch, exceptions
from flask import Flask
es = Elasticsearch(host='es')

app = Flask(__name__)
 

@app.route('/')

def hello_world():
    return 'Hello ninja'
	
app.run(host='0.0.0.0', port=5000)
