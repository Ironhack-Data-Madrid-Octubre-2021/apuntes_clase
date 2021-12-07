import pandas as pd

def cargadataframe():
    data = pd.read_pickle("data/clean.pkl")
    return data

def renombra_id(x):
    x = f"Frase {x}"
    return x


def grafico(personaje):
    data = cargadataframe()
    data = data[(data["character_name"]==f"{personaje}")]
    data = data[["frase","polarity"]].reset_index(drop=True)
    data["frase"] = data.index+1
    data["frase"] = data.frase.apply(renombra_id)
    return data


def bar_1():
    data = cargadataframe()
    data = data.groupby("character_name").agg({"character_name":'count'}).rename(columns={"character_name":"character_name", "character_name":"número de frases"}).reset_index().set_index("character_name", drop=True)
    return data


def lista_personajes():
    data = cargadataframe()
    return list(data.character_name.unique())