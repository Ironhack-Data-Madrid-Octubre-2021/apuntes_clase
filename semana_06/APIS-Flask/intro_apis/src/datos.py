import random
from googletrans import Translator

def refranes():
    lista = ["Al buen día, ábrele la puerta.", "Amores nuevos, casa con pucheros.", "Invierno lluvioso, verano abundoso.", "A quien madruga, Diosa le sube en el cohete"]
    return random.choice(lista)

def refranes_2(lang):
    trans = Translator()
    if lang == "es":
        return refranes()
    elif lang == "en":
        refran = refranes()
        traducido = trans.translate(refranes(), dest="en").text
        return f"{traducido}"
    else:
        return refranes()


def pepe():
    return {"pepe": 33, "casa": "Ironhack"}