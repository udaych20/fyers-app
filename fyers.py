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
from flask import Flask, request, jsonify
from flask_cors import CORS  # Import the CORS class
import logging

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
        print('buy - ',option_string)
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

