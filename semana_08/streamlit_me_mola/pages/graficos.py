import streamlit as st
import src.manage_data as dat
import plotly.express as px
import codecs
import streamlit.components.v1 as components


def app():
    st.write("""
    # Página de gráficos
    Gráfico propio de streamlit
    """)

    data_bar = dat.bar_1()
    st.bar_chart(data_bar)
    person = st.selectbox("selecciona un person", dat.lista_personajes())
    
    datos_para_el_grafico = dat.grafico(person)
    st.write("""
    Aquí tines la polaridad de: 
    """, person)
    fig = px.line(datos_para_el_grafico, y="polarity")
    st.plotly_chart(fig)



    
    f=codecs.open("data/tabLOL.html", 'r')
    tableau = f.read()
    components.html(tableau,height=550,scrolling=True)



    




