from config.configuration import engine
import pandas as pd
from textblob import TextBlob

def personajes():
    query = list(engine.execute("SELECT distinct(character_name) FROM HP.frases;"))
    lista =  [{"nombre": elemento[0]} for elemento in query]
    return lista

def traduce(x):
    import time
    time.sleep(1)
    texto = TextBlob(x)
    traducido = f"{texto.translate(from_lang='en', to='es')}"
    return traducido 


def lasfrases(personaje,lan):
    query = f"""
    SELECT dialogue 
    FROM HP.frases 
    WHERE character_name = '{personaje}';
    """

    eldata = pd.read_sql_query(query,engine)
    
    if lan == "es":
        eldata["es"] = eldata.dialogue.apply(traduce)
        eldata.drop(columns="dialogue", inplace=True)
        return eldata.to_json(orient="records")
    elif lan == "en":
        return eldata.to_json(orient="records")
    
    else:
        return eldata.to_json(orient="records")




def nuevomensaje(escena,frase,personaje):

    engine.execute(f"""
    INSERT INTO frases (scene,character_name,dialogue)
    VALUES ({escena}, '{personaje}', '{frase}');
    """)
    
    return f"Se ha introducido correctamente: {escena} {personaje} {frase}"