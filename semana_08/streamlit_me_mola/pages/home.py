import streamlit as st
from PIL import Image
import streamlit.components.v1 as components
import codecs

def app():
    portada = Image.open("images/portada2.jpg")
    st.image(portada, use_column_width=True)
    st.write("""
    # My awesome Dashboard
    ## Son headers reinas 🚀
    Con Jake el perro y Finn el humano lo pasaremos *guay*
    """)
    f=codecs.open("data/pedrito.html", 'r')
    pedro = f.read()

    components.html(pedro,height=550,scrolling=True)


