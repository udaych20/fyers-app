# -*- coding: utf-8 -*-
"""
Created on Wed Aug 30 22:02:09 2023

@author: udayc
"""

from fyers_apiv3 import fyersModel
import time
from pyotp import TOTP
from selenium import webdriver
from selenium.webdriver.common.by import By
from urllib.parse import urlparse, parse_qs
import mysql.connector
import requests
import time
import pytz
from datetime import datetime, timedelta
import pandas as pd
from fyers_apiv3.FyersWebsocket import data_ws
import os 


db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Karthi@23',
    'database': 'algo'
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
    
# Reading configuration from database - fyers_config table
redirect_uri= getConfgValueByKey("redirect_uri")  
client_id = getConfgValueByKey("client_id")
secret_key = getConfgValueByKey("secret_key")                       
grant_type = getConfgValueByKey("grant_type")                 
response_type = getConfgValueByKey("response_type")
state = getConfgValueByKey("state")



appSession = fyersModel.SessionModel(client_id = client_id, redirect_uri = redirect_uri,response_type=response_type,state=state,secret_key=secret_key,grant_type=grant_type)
# ## Make  a request to generate_authcode object this will return a login url which you need to open in your browser from where you can get the generated auth_code 
generateTokenUrl = appSession.generate_authcode()



def first_time_login():
    service = webdriver.chrome.service.Service('./chromedriver')
    service.start()
    options = webdriver.ChromeOptions()
    # options.add_argument('--headless')
    # options = options.to_capabilities()
    driver = webdriver.Remote(service.service_url, options=options)
    driver.get(generateTokenUrl)
    driver.implicitly_wait(10)
    driver.find_element(By.XPATH,'//*[@id="mobile-code"]').send_keys(getConfgValueByKey("mobile-no"))
    driver.find_element(By.XPATH,'//*[@id="mobileNumberSubmit"]').click()
    totp = TOTP(getConfgValueByKey("totp-token"))
    token = totp.now()
    # driver.find_element(By.XPATH,'//*[@id="mobile-code"]').send_keys(token)
    driver.find_element(By.XPATH,'//*[@id="first"]').send_keys(token[0])
    driver.find_element(By.XPATH,'//*[@id="second"]').send_keys(token[1])
    driver.find_element(By.XPATH,'//*[@id="third"]').send_keys(token[2])
    driver.find_element(By.XPATH,'//*[@id="fourth"]').send_keys(token[3])
    driver.find_element(By.XPATH,'//*[@id="fifth"]').send_keys(token[4])
    driver.find_element(By.XPATH,'//*[@id="sixth"]').send_keys(token[5])
    driver.find_element(By.XPATH,'//*[@id="confirmOtpSubmit"]').click()
    time.sleep(10)
    request_token = request_token=driver.current_url
    parsed_url = urlparse(request_token)
    query_parameters = parse_qs(parsed_url.query)
    auth_code = query_parameters.get('auth_code', [None])[0]
    # refresh_token = query_parameters.get('refresh_token', [None])[0]
    saveConfig("auth_code",auth_code)
    driver.quit()

response = {}
if (getConfgValueByKey("login") != "success"):
    first_time_login()  
    time.sleep(2)
    appSession.set_token(getConfgValueByKey("auth_code"))
    response = appSession.generate_token()
    access_token = response["access_token"]
    saveConfig("access_token", access_token)
    saveConfig("refresh_token", response["refresh_token"])
    saveConfig("login", "success")
else:
    url = "https://api-t1.fyers.in/api/v3/validate-refresh-token";
    headers = {"Content-Type": "application/json"}
    data = {"grant_type":"refresh_token","appIdHash":getConfgValueByKey("app_id_hash"),"refresh_token":getConfgValueByKey("refresh_token"),"pin":getConfgValueByKey("pin")}
    response = requests.post(url, json=data, headers=headers)
    response_data = response.json()
    access_token = response_data["access_token"]
    saveConfig("access_token", access_token)
    if(response_data["s"] != "ok"):
        saveConfig("login", "failed")
        


fyers = fyersModel.FyersModel(token=access_token,is_async=False,client_id=client_id,log_path="")


ist_timezone = pytz.timezone('Asia/Kolkata')

current_timestamp = datetime.now(ist_timezone)
timestamp_current_ist = int(current_timestamp.timestamp())


two_days_ago = current_timestamp  - timedelta(minutes=5)
timestamp_two_days_ago = int(two_days_ago.timestamp())


# cursor.close()



new_token = f"{client_id}:{access_token}"

symbols=getConfgValueByKey("auth_code")

connection.close()
# data = {"symbol":"NSE:NIFTY23SEPFUT","resolution":"1","date_format":"0","range_from":"1695008700","range_to":"1695008820","cont_flag":"0"}
# hist = fyers.history(data)
# sdata = pd.DataFrame(hist["candles"])
# sdata.columns = ['date','open','high','low','close','volume']
# sdata['date'] = pd.to_datetime(sdata['date'], unit='s', origin='unix', utc=True).dt.tz_convert('Asia/Kolkata')
# sdata['date'] = sdata['date'].dt.strftime('%Y-%m-%d %H:%M')
# print(sdata)


###############################################################################################

def onmessage(message):
    """
    Callback function to handle incoming messages from the FyersDataSocket WebSocket.

    Parameters:
        message (dict): The received message from the WebSocket.

    """
    print(message["ltp"])


def onerror(message):
    """
    Callback function to handle WebSocket errors.

    Parameters:
        message (dict): The error message received from the WebSocket.


    """
    print("Error:", message)


def onclose(message):
    """
    Callback function to handle WebSocket connection close events.
    """
    print("Connection closed:", message)


def onopen():
    """
    Callback function to subscribe to data type and symbols upon WebSocket connection.

    """
    # Specify the data type and symbols you want to subscribe to
    data_type = "SymbolUpdate"

    # Subscribe to the specified symbols and data type
    symbols = ['NSE:NIFTY23SEPFUT']
    fyers.subscribe(symbols=symbols, data_type=data_type)

    # Keep the socket running to receive real-time data
    fyers.keep_running()


# Create a FyersDataSocket instance with the provided parameters
fyers = data_ws.FyersDataSocket(
    access_token=new_token,       # Access token in the format "appid:accesstoken"
    log_path="",                     # Path to save logs. Leave empty to auto-create logs in the current directory.
    litemode=True,                  # Lite mode disabled. Set to True if you want a lite response.
    write_to_file=False,              # Save response in a log file instead of printing it.
    reconnect=True,                  # Enable auto-reconnection to WebSocket on disconnection.
    on_connect=onopen,               # Callback function to subscribe to data upon connection.
    on_close=onclose,                # Callback function to handle WebSocket connection close events.
    on_error=onerror,                # Callback function to handle WebSocket errors.
    on_message=onmessage             # Callback function to handle incoming messages from the WebSocket.
)

fyers.connect()



