import streamlit as st
import src.manage_data as dat

def app():
    st.write("Datos de Hora de Aventuras")
    st.dataframe(dat.cargadataframe())
