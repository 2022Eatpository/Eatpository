from asyncio.windows_events import NULL
import requests
from Eatpository.secrets import KAKAO_API_KEY
import json

store_list = ['포보 홍대점', '카미야', '타코몽', '무쇠김치삼겹 홍대점', '카츠오모이', '금복식당', '우리엄마레시피', '비스트로큐슈', '슈슈', '플레이트946', '비스트로주라', '홍대발바리네', '넙딱집 상수점', '미로식당', '마코토', '상수곱창', '제순식당', '옛맛서울불고기', '야키토리 나루토', '후계동', '루시드', '카타코토', '슬로우캘리', '뇽즈', '야키토리 미식서울', '릴린', '원당감자탕 홍대점', '대왕고추장불고기', '델문도', '야키토리 묵', '요코스카쓰나미', '교다이야', '비스트로오라', '지로우라멘', '라멘트럭', '더피자보이즈', '소코아 홍대점', '식스티즈', '바다회사랑', '멕시칸식당베르데']
result = []

for store in store_list:
    searching = '홍대' + store
    url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(
        searching)
    headers = {
        "Authorization": KAKAO_API_KEY
    }

    try:
        places = requests.get(url, headers=headers).json()['documents'][0]
        
        # 아이디, 상호명, 도로명 주소, 카테고리, 경도, 위도, 장소 상세 페이지
        # id, place_name, road_address_name, category_group_name, x, y, place_url
        # distance 추가 가능
        # 중심좌표까지의 거리 (단, x,y 파라미터를 준 경우에만 존재) 단위: 미터(m)

        data = {}
        
        data['id'] = int(places['id'])
        data['store_name'] = places['place_name']
        data['main_menu'] = places['category_group_name']
        data['address'] = places['road_address_name']
        data['longitude'] = float(places['x'])
        data['latitude'] = float(places['y'])
        data['time'] = NULL
        data['phone_number'] = places['phone']
        data['image'] = NULL
        
        result.append(data)
    except Exception as e:
        print(f"{e} : {store} is not found")

with open(r"C:\Users\danha\Documents\GitHub\Eatpository\Backend\stores.json", 'w', encoding='utf-8') as outfile:
    json.dump(result, outfile, indent="\t", ensure_ascii=False)
