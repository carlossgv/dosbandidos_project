import json
import os
import pprint

import requests

def get_payments(url, merchant_id, initial_date, finish_date):
    headers = {'accept': 'application/json', 'authorization': f'Bearer {os.environ.get("DOSBANDIDOS_CLOVER_API")}'}
    response = requests.get(f'{url}/v3/merchants/{merchant_id}/payments?filter=createdTime>1621141200000&filter'
                            f'=createdTime<1621227540000', headers=headers)
    
    payments = response.json()

    return payments


merchant_info = get_payments('https://api.clover.com', '459RV00NPJJ11')
pprint.pprint(merchant_info)
