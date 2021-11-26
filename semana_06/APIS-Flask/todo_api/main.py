from os import name
from flask import Flask, request, jsonify
import markdown.extensions.fenced_code
import tools.mongo_tools as mongo
import tools.sql_tools as sql


app = Flask(__name__)

@app.route("/")
def index():
    readme_file = open("README.md", "r")
    md_template = markdown.markdown(readme_file.read(), extensions = ["fenced_code"])
    return md_template


@app.route("/frases/<name>")
def todas(name):
    person = name
    frases = mongo.todas_frases(person)
    return jsonify(frases)


@app.route("/nuevafrase", methods=["POST"])
def insertamensaje():

    database = request.args["db"]

    if database == "mongo":
        diccionario = {"scene": request.form.get("escena"),
    "character_name": request.form.get("personaje"), 
    "dialogue": request.form.get("frase")}
        return mongo.padentro(diccionario)
    elif database == "sql":
        scene = request.form.get("escena")
        char_ = request.form.get("personaje")
        dialogue = request.form.get("frase")
        return sql.nuevomensaje(scene, dialogue, char_)

    else:
        return "Tienes que poner en el parámetro db si quieres mongo o sql"

    
    




app.run(debug=True)