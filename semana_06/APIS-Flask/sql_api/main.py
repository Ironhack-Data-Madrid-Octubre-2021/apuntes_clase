from flask import Flask, request
from flask import jsonify
import tools.sql_tools as sqt

app = Flask(__name__)


@app.route("/")
def inicio():
    return "Hola Mundo"




@app.route("/personajes")
def damelos():
    persons = sqt.personajes()
    return jsonify(persons)


@app.route("/frases/<name>")
def frases(name):
    idioma = request.args.get("idioma")
    frasecitas = sqt.lasfrases(name, idioma)
    return jsonify(frasecitas)

















app.run(debug=True)