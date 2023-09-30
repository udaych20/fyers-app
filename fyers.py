# -*- coding: utf-8 -*-
"""
Created on Wed Aug 30 22:02:09 2023

@author: udayc
"""

from fyers_apiv3 import fyersModel
# import time
import pytz
from datetime import datetime, timedelta
# from fyers_apiv3.FyersWebsocket import data_ws
# import os 
import db
import login

# Reading configuration from database - fyers_config table
redirect_uri= db.getConfgValueByKey("redirect_uri")  
client_id = db.getConfgValueByKey("client_id")
secret_key = db.getConfgValueByKey("secret_key")                       
grant_type = db.getConfgValueByKey("grant_type")                 
response_type = db.getConfgValueByKey("response_type")
state = db.getConfgValueByKey("state")

# generateTokenUrl = login.createSession(client_id, redirect_uri, state, secret_key, response_type, grant_type)
appSession = fyersModel.SessionModel(client_id = client_id, redirect_uri = redirect_uri,response_type=response_type,state=state,secret_key=secret_key,grant_type=grant_type)

access_token = login.authenticate(appSession.generate_authcode(),appSession)

fyers = fyersModel.FyersModel(token=access_token,is_async=False,client_id=client_id,log_path="")




# # ###############################################################################################
# new_token = f"{client_id}:{access_token}"

# auth_code=db.getConfgValueByKey("auth_code")

# data = {"symbol":"NSE:NIFTYBANK-INDEX","resolution":"1","date_format":"0","range_from":"1695008700","range_to":"1695008820","cont_flag":"0"}
# hist = fyers.history(data)
# print(hist)
# sdata = pandas.DataFrame(hist["candles"])
# sdata.columns = ['date','open','high','low','close','volume']
# sdata['date'] = pandas.to_datetime(sdata['date'], unit='s', origin='unix', utc=True).dt.tz_convert('Asia/Kolkata')
# sdata['date'] = sdata['date'].dt.strftime('%Y-%m-%d %H:%M')
# print(sdata)
# # ###############################################################################################



# ###############################################################################################

# def onmessage(message):
#     """
#     Callback function to handle incoming messages from the FyersDataSocket WebSocket.

#     Parameters:
#         message (dict): The received message from the WebSocket.

#     """
#     query = "insert into stock_data(symbol,exch_feed_time,ltp,day_high,day_low,day_open,prev_close_price) values (%s,%s,%s,%s,%s,%s,%s)"
#     query1 = "insert into stock_resp(message) values (%s)"
#     if message["ltp"]:
#         db.update_symbol_data(query1,message)
#         # print(message)
#         # json = message
#         # symbol = message["symbol"]
#         # exch_feed_time = db.convert_epoch_to_date(message["exch_feed_time"])
#         # ltp = message["ltp"],
#         # day_high = message["high_price"]
#         # day_low = message["low_price"]
#         # day_open = message["open_price"]
#         # prev_close_price = message["prev_close_price"]
#         # print(query,symbol,exch_feed_time,ltp,day_high,day_low,day_open,prev_close_price)
        
      


# def onerror(message):
#     """
#     Callback function to handle WebSocket errors.

#     Parameters:
#         message (dict): The error message received from the WebSocket.


#     """
#     print("Error:", message)


# def onclose(message):
#     """
#     Callback function to handle WebSocket connection close events.
#     """
#     print("Connection closed:", message)


# def onopen():
#     """
#     Callback function to subscribe to data type and symbols upon WebSocket connection.

#     """
#     # Specify the data type and symbols you want to subscribe to
#     data_type = "SymbolUpdate"

#     # Subscribe to the specified symbols and data type
#     # symbols = ["NSE:NIFTY23SEPFUT","NSE:NIFTY50-INDEX" , "NSE:NIFTYBANK-INDEX"]
#     symbols = ["NSE:NIFTYBANK-INDEX"]
#     # ["MCX:NATURALGAS23SEPFUT"]
#     fyersSocket.subscribe(symbols=symbols, data_type=data_type)

#     # Keep the socket running to receive real-time data
#     fyersSocket.keep_running()



# # Create a FyersDataSocket instance with the provided parameters
# fyersSocket  = data_ws.FyersDataSocket(
#     access_token=new_token,          # Access token in the format "appid:accesstoken"
#     log_path="",                     # Path to save logs. Leave empty to auto-create logs in the current directory.
#     litemode=False,                   # Lite mode disabled. Set to True if you want a lite response.
#     write_to_file=True,             # Save response in a log file instead of printing it.
#     reconnect=True,                  # Enable auto-reconnection to WebSocket on disconnection.
#     on_connect=onopen,               # Callback function to subscribe to data upon connection.
#     on_close=onclose,                # Callback function to handle WebSocket connection close events.
#     on_error=onerror,                # Callback function to handle WebSocket errors.
#     on_message=onmessage             # Callback function to handle incoming messages from the WebSocket.
# )

# fyersSocket.connect()


# ######################################################################################################################


# symbols=db.getConfgValueByKey("auth_code")

from flask import Flask, request, jsonify
from flask_cors import CORS  # Import the CORS class
import logging



app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app
app.logger.setLevel(logging.DEBUG) 

@app.route('/api/index-options', methods=['GET'])
def get_index_options():
    # Replace this with actual data retrieval logic
    index_options = ["BANKNIFTY","FINNIFTY","NIFTY50"]
    return jsonify(index_options)

@app.route('/api/index-expiry', methods=['POST'])
def get_index_option_expiry():
    req = request.get_json()
    index = req.get("index");
    print(index)
    data = db.getIndexOptionExpiries(index)
    flat_array = [date for sublist in data for date in sublist]
    return jsonify(flat_array)

# start = 43700
# end = 45400
# frequency = 100
# values_list = []
# for value in range(start, end + 1, frequency):
#    values_list.append(value)

@app.route('/api/index-strike', methods=['POST'])
def get_index_strike():
    req = request.get_json()
    symbol = req.get("index")
    if(symbol == "BANKNIFTY"):
        symbol = "NIFTYBANK"
    index = "NSE:"+symbol+ "-INDEX"
    ist_timezone = pytz.timezone('Asia/Kolkata')
    current_timestamp = datetime.now(ist_timezone)
    range_to = int(current_timestamp.timestamp())
    two_days_ago = current_timestamp  - timedelta(minutes=5)
    range_from = int(two_days_ago.timestamp())
    data = {"symbol":index,"resolution":"1D","date_format":"0","range_from":range_from,"range_to":range_to,"cont_flag":"0"}
    hist = fyers.history(data)
    return jsonify(hist)

@app.route('/api/quantity', methods=['GET'])
def get_index_quantity():
    return  jsonify(15)

@app.route('/api/positions', methods=['GET'])
def get_positions():
    return  jsonify(fyers.positions())

@app.route('/api/funds', methods=['GET'])
def get_funds():
    return  jsonify(fyers.funds())

@app.route('/api/get-pending-orders', methods=['GET'])
def get_pending_orders():
    return  jsonify(fyers.orderbook(data=None))

@app.route('/api/cancel-pending-orders', methods=['POST'])
def cencel_pending_orders():
    data = request.get_json()
    print(data)
    return  jsonify(fyers.cancel_multi_order(data))

@app.route('/api/call-buy', methods=['POST'])
def call_buy():
    try:
        # Get the data from the request's JSON body
        data = request.get_json()
        print('data - ',data)
        # Perform some processing with the data
        # Replace this with your actual logic
        index = data.get('index')
        expiry = data.get('expiry')
        strike = data.get('strike')
        optionType = data.get("optionType")
        quantity = data.get("quantity")
        buyOrSell = data.get("buyOrSell")
        
        parts = expiry.split("-")
        day, month, year = parts[0], parts[1], parts[2]
        formatted_date = year[-2:] +  month[0] + day
        
        # NSE:BANKNIFTY23SEP44600CE
        option_string = 'NSE:'+index+formatted_date+strike+optionType
        
        data =  {
        "symbol":option_string,
        "qty":quantity,
        "type":2,
        "side":buyOrSell,
        "productType":"INTRADAY",
        "limitPrice":0,
        "stopPrice":0,
        "validity":"DAY",
        "disclosedQty":0,
        "offlineOrder":False,
        "stopLoss":0,
        "takeProfit":0
        }       
        resp = jsonify(fyers.place_order(data))
        # resp =option_string
        return resp, 200
    except Exception as e:
        return jsonify({'error': e}), 500
    
      
@app.route('/api/exit_all_positions', methods=['POST'])
def exit_all_positions():
    try:
        ### Exit All Position 
        data  = {}
        return jsonify(fyers.exit_positions(data)), 200
    except Exception as e:
        return jsonify({'error': e}), 500


@app.route('/api/test', methods=['GET'])
def test():
    try:
        return jsonify("test"), 200
    except Exception as e:
        return jsonify({'error': e}), 500


if __name__ == '__main__':
    app.run(debug=True)

