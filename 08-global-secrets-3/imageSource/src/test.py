import json
import os
import time

def getSecrets():
    print('===================')
    print('')
    print("Reading Secrets...")
    if "SECRET1" in os.environ:
        secret1=os.environ["SECRET1"]
        print("SECRET1 is present: ", secret1)
    if "SECRET2" in os.environ:
        secret2=os.environ["SECRET2"]
        print("SECRET2 is present: ", secret2)
    print('')

def getGlobalConfig():
    with open('/appconfig/global.json') as json_file:
        print("Reading Global Config")
        data = json.load(json_file)
        try:
            print(data)
            print("Variable exampleKeyGlobal: ", data["exampleKeyGlobal"])
            print('')
        except:
            print('Variable exampleKeyGlobal not found')
            print('')
            
def getLocalConfig():
    with open('/appconfig/appconfig.json') as json_file:
        print("Reading App Config")
        try:
            data = json.load(json_file)
            print(data)
            print("Variable exampleKeyLocal: ", data["exampleKeyLocal"])
            print('')
        except:
            print('Variable exampleKeyLocal not found')
            print('')

def main():
    while True:
        getSecrets()
        getGlobalConfig()
        getLocalConfig()
        time.sleep(5)

main()

