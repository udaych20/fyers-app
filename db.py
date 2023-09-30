# -*- coding: utf-8 -*-
"""
Created on Wed Sep 20 21:35:15 2023

@author: udayc
"""
import mysql.connector
from datetime import datetime, timedelta
import pandas

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Karthi@23',
    'database': 'algo1'
}
connection = mysql.connector.connect(**db_config)

configQuery = "select value_name from fyers_config where key_name= %s and enabled=true"
def getConfgValueByKey(key_name):
    c = connection.cursor()
    c.execute(configQuery,(key_name,));
    value = c.fetchall()[0][0]
    c.close()
    return value;

def saveConfig(key_name,value_name):
    if  getConfgValueByKey(key_name):
        updateConfig(key_name, value_name)
    else:
        current_datetime = datetime.now()
        cursor = connection.cursor()
        cursor.execute("insert into fyers_config(key_name,value_name,enabled,updated_at) values (%s,%s,true,%s)",(key_name,value_name,current_datetime))
        connection.commit()
        cursor.close()

def updateConfig(key_name,value_name):
    uc = connection.cursor()
    current_datetime = datetime.now()
    uc.execute("UPDATE fyers_config SET value_name=%s, updated_at=%s WHERE key_name=%s AND enabled=true", (value_name, current_datetime, key_name))
    connection.commit()
    uc.close()

def update_symbol_data(query,message):
    # print(query,symbol,exch_feed_time,ltp,day_high,day_low,day_open,prev_close_price)
    uc1 = connection.cursor()
    # current_datetime = datetime.now()
    # print(convert_epoch_to_date(message["exch_feed_time"]))
    uc1.execute(query, (message,))
    print(message)
    connection.commit()
    uc1.close()
    
def convert_epoch_to_date(epoch_val):
    utc_datetime = datetime.datetime.utcfromtimestamp(epoch_val)
    ist_offset = datetime.timedelta(hours=5, minutes=30)
    return utc_datetime + ist_offset

indexOptionsQuery = "select expiry_date from index_expiries where symbol= %s order by id asc"
def getIndexOptionExpiries(symbol):
    c = connection.cursor()
    c.execute(indexOptionsQuery,(symbol,));
    value = c.fetchall()
    c.close()
    return value;

    
def closeConnection():
    connection.close()