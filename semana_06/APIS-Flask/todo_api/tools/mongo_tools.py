from config.mongo_config import db,c

def todas_frases(nombre):
    query = {"character_name": f"{nombre}"}
    frases = list(c.find(query, {"_id": 0})) # El ID hay que quitarlo si no, no voy a poder jsonizar y la api va a dar error
    return frases


def padentro(diccionario):
    c.insert_one(diccionario)
    return f"he insertado {diccionario} en la base de datos"