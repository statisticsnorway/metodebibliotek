import pandas as pd
from pandas.io.json import json_normalize
from datetime import date as dt
import requests
import numpy as np

def MakeUrl(klass, correspond, cortype, fratil, date, language):
    """
    Function to build url address for query to Statsitic Norways KLASS system
    
    Parameters
    ----------------------------------------------------------------------
    klass: number for the classification as a str og int
    correspond: Whether changes should be returned (True), just codes (False) or corespondence to another klass (int)
    cortype: Typy of return value, "vanlig" for normal coding, "changes" for changes within the klass.
    fratil: Boolean for if date is a list (length two) of dates to get changes for (True) or a single date (False)
    date: str or list of two str for date of calssification in format %Y-%m-%d
    language: "nb" for Norwegian Bokmål, "nn" for new Norwegian and "en" for English.
    
    Return
    ----------------------------------------------------------------------
    Url address for query (str)
    
    """
    if cortype == "vanlig" and fratil == False:
        coding = "/codesAt.json?date="+date
        
    if cortype == "vanlig" and fratil == True:
        coding = "/codes.json?from="+ date[0]+ "&to="+ date[1]
        
    if cortype == "change":
        coding = "/changes.json?from="+date[0]+"&to="+date[1]
        
    language_coding = "&language=" + language
    
    url = "http://data.ssb.no/api/klass/v1/classifications/"+klass+coding+language_coding

    return url


def GetKlass(klass, date = None, correspond = False, language = "nb"):
    """
    Function to query and return classifications from Statsitic Norway's KLASS system as a pandas dataframe.
    
    Parameters
    ----------------------------------------------------------------------
    klass: number for the classification as a str og int
    date: str or list of two str for date of calssification in format %Y-%m-%d
    correspond: Whether changes should be returned (True), just codes (False) or the klass number to correspond to another klass (int)
    language: str for the output language. Chooose between "nb" for Bokmål, "nn" for Nynorsk or "en" for English.
    
    Return
    ----------------------------------------------------------------------
    pandas dataframe with codes, correspondence table or changes
    
    """
    
    if correspond == True:
        cortype = "change" #get changes only - full correspondence tables not available yet
    elif correspond == False:
        cortype = "vanlig" #or get normal codes
    else:
        raise typeError("Correspondance table not available yet")
        
    klass = str(klass)
    
    if date is None:
        date = dt.today().strftime("%Y-%m-%d")
        fratil = False
    elif isinstance(date, str):
        fratil = False
    else:
        fratil = True
    
    url = MakeUrl(klass, correspond, cortype, fratil, date, language)
    temp = requests.get(url)
    data1 = pd.read_json(temp.text)
    
    if cortype == "vanlig":
        datum = json_normalize(data1['codes'])
    elif cortype == "change":
        datum = json_normalize(data1['codeChanges'])

    return datum