import math

import streamlit as st
import numpy as np
import pandas as pd
from matplotlib import pyplot as plt

st.title('Uber pickups test')

DATA_SOURCE = 'https://s3-us-west-2.amazonaws.com/streamlit-demo-data/uber-raw-data-sep14.csv.gz'

@st.cache(allow_output_mutation=True)

def download_data():
    return (pd.read_csv(DATA_SOURCE, nrows=10000).rename(columns={'Lat':'lat','Lon':'lon'}))

df = download_data()

df2 = df
df2['Date'] = pd.to_datetime(df2['Date/Time'])
df2['Hours'] = df2.Date.dt.hour

minimo = df2.Hours.min()
minimo = minimo.item()
maximo = df2.Hours.max()
maximo = maximo.item()

values = st.slider('Select a range of hours', minimo, maximo, value=[2,20])
df2 = df.loc[(df2['Hours']>=values[0]) & (df2['Hours']<=values[1])]


page_size = 1000
total_pages = math.ceil(len(df2)/page_size)
starting_value = 0
slider = st.slider('Select the page', 1,total_pages)

#st.write('page selected', slider, 'with_limits',())
st.write('page selected', slider, 'with_limits',(((slider-1)*page_size),(slider*page_size)-1))
df2 = df2.loc[((slider-1)*page_size):(slider*page_size)-1]
df2

st.map(df2)

graph = pd.to_datetime(df['Date/Time']).dt.hour

st.bar_chart(graph)



