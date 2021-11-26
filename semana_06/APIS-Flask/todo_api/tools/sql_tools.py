from config.sql_config import engine


def nuevomensaje(escena,frase,personaje):

    engine.execute(f"""
    INSERT INTO frases (scene,character_name,dialogue)
    VALUES ({escena}, '{personaje}', '{frase}');
    """)
    
    return f"Se ha introducido correctamente: {escena} {personaje} {frase}"