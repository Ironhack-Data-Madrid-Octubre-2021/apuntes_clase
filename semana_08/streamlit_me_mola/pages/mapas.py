import streamlit as st
from streamlit_folium import folium_static
import streamlit.components.v1 as components
import codecs
import folium
import requests


def app():
    st.write("""
    ### Mapita de Folium

    """)
    default_value_goes_here = "Paseo de la chopera 14, Madrid"
    user_input = st.text_input("Introduce dirección", default_value_goes_here)

    data = requests.get(f"https://geocode.xyz/{user_input}?json=1").json()
    latlon = [data["latt"],data["longt"]]
    

    icono = folium.Icon(color="blue",
             prefix = "fa",
             icon="rocket",
             icon_color="black")
    datos = {"location": latlon, "tooltip": "Lo que buscas", "icon":icono}
    mark = folium.Marker(**datos)

    map_1 = folium.Map(location = latlon, zoom_start=15)
    mark.add_to(map_1)

    folium_static(map_1)


    st.write("""
    ### Mapita insertado con HTML
    """)

    f=codecs.open("data/mapa.html", 'r')
    mapa = f.read()

    components.html(mapa,height=550,scrolling=True)

