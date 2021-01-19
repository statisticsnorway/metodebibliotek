

def test_MakeUrl():
    """
    Test function for MakeUrl
    """
    test_url = MakeUrl(131, correspond = False, cortype = "vanlig", fratil = False, date = "2020-01-01", language = "nb")
    
    expect_url = "http://data.ssb.no/api/klass/v1/classifications/131/codesAt.json?date=2020-01-01&language=nb"
    assert test_url == expect_url, "MakeUrl function not returning correctly"
   

    
if __name__ == '__main__':
    test_MakeUrl()