from flask import Flask, request
from flask import jsonify
import src.paraeldado as da
import src.datos as dat

app = Flask(__name__)



@app.route("/")
def inicial():
    return jsonify("hola mundo")

@app.route("/dado")
def dado():
    parsear = jsonify(da.tiraeldado())
    return parsear
    


@app.route("/refran")
def dameunrefran():
    refran = dat.refranes()
    return jsonify(refran)


@app.route("/unamuyfacil")
def facil():
    return jsonify(dat.pepe())






@app.route("/refrantuneado")
def refran_t():
    # parámetros entre paréntesis no obligatorios
    lan = request.args.get("idioma")
    # Parámetro entre corchetes, obligatorio (required) si no está, la api devuelve error 500
    frase = request.args["algo"]
    refran = dat.refranes_2(lan)
    diccionario = {"tú me has dicho": frase, "yo te digo": refran}
    return jsonify(diccionario)








if __name__ == "__main__":
    app.run(debug=True)