from asyncio.windows_events import NULL
import requests
from Backend.Eatpository.secrets import KAKAO_API_KEY
import json

store_list = ['카미야', '하카타분코']
result = []

for store in store_list:
    searching = '홍대' + store
    url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(
        searching)
    headers = {
        "Authorization": KAKAO_API_KEY
    }

    places = requests.get(url, headers=headers).json()['documents'][0]

    data = {}

    # 아이디, 상호명, 도로명 주소, 카테고리, 경도, 위도, 장소 상세 페이지
    # id, place_name, road_address_name, category_group_name, x, y, place_url
    # distance 추가 가능
    # 중심좌표까지의 거리 (단, x,y 파라미터를 준 경우에만 존재) 단위: 미터(m)

    data['id'] = places['id']
    data['store_name'] = places['place_name']
    data['main_menu'] = places['category_group_name']
    data['address'] = places['road_address_name']
    data['longitude'] = places['x']
    data['latitude'] = places['y']
    data['time'] = NULL
    data['phone_number'] = places['phone']
    data['image'] = NULL

    result.append(data)

print(result)

with open(r"C:\Users\danha\Documents\GitHub\Eatpository\Backend\stores.json", 'w', encoding='utf-8') as outfile:
    json.dump(result, outfile, indent="\t", ensure_ascii=False)
