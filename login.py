# -*- coding: utf-8 -*-
"""
Created on Wed Sep 20 21:41:07 2023

@author: udayc
"""
from pyotp import TOTP
from selenium import webdriver
from selenium.webdriver.common.by import By
from urllib.parse import urlparse, parse_qs
import db
import time

from fyers_apiv3 import fyersModel
import requests


def first_time_login(generateTokenUrl):
    service = webdriver.chrome.service.Service('./chromedriver')
    service.start()
    options = webdriver.ChromeOptions()
    # options.add_argument('--headless')
    # options = options.to_capabilities()
    driver = webdriver.Remote(service.service_url, options=options)
    driver.get(generateTokenUrl)
    driver.implicitly_wait(10)
    driver.find_element(By.XPATH,'//*[@id="mobile-code"]').send_keys(db.getConfgValueByKey("mobile-no"))
    driver.find_element(By.XPATH,'//*[@id="mobileNumberSubmit"]').click()
    totp = TOTP(db.getConfgValueByKey("totp-token"))
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
    db.saveConfig("auth_code",auth_code)
    driver.quit()
    
def authenticate(generateTokenUrl,appSession):
    response = {}
    if (db.getConfgValueByKey("login") != "success"):
        first_time_login(generateTokenUrl)  
        time.sleep(5)
        auth_code_val = db.getConfgValueByKey("auth_code")
        print('auth_code_val',auth_code_val)
        print('appSession - ',appSession)
        appSession.set_token(auth_code_val)
        response = appSession.generate_token()
        access_token = response["access_token"]
        db.saveConfig("access_token", access_token)
        db.saveConfig("refresh_token", response["refresh_token"])
        db.saveConfig("login", "success")
        return access_token;
    else:
        url = "https://api-t1.fyers.in/api/v3/validate-refresh-token";
        headers = {"Content-Type": "application/json"}
        data = {"grant_type":"refresh_token","appIdHash":db.getConfgValueByKey("app_id_hash"),"refresh_token":db.getConfgValueByKey("refresh_token"),"pin":db.getConfgValueByKey("pin")}
        response = requests.post(url, json=data, headers=headers)
        response_data = response.json()
        access_token = response_data["access_token"]
        db.saveConfig("access_token", access_token)
        if(response_data["s"] != "ok"):
            db.saveConfig("login", "failed")
        return access_token;


        