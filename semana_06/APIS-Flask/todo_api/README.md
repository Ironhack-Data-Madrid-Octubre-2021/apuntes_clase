
# Creando una API básica para explicar Flask en el Bootcamp de Data en Ironhack.
La api tendrá un método POST para introducir datos y un método GET para extraer datos

# ¿Cómo Funciona?

# @POST
Endpoint
- /nueva/frase

De esta manera insertamos una frase en la base de datos.


# @GET
Endpoint
- /frases/<name>

Extraemos todas las frases que tenemos de un usuario en la base de datos

```
url_frases = "http://localhost:5000/frases/"
person = "Albus Dumbledore"
```


## ¿Qué personajes hay?
Para saber los usuarios que hay en la base de datos tienes que hacer una query del tipo get al endpoint /personajes

