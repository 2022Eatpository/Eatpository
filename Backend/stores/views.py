import random
from django.shortcuts import render
from stores.serializers import StoreSerializer, StoreRandomSerializer
from .models import Stores
from accounts.models import Users
from django.shortcuts import render, redirect
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework import status
from django.http import JsonResponse
from asyncio.windows_events import NULL
import requests
from .secrets import KAKAO_API_KEY
import json
import selenium
from selenium import webdriver
from urllib.request import urlopen
from selenium.webdriver.common.keys import Keys
import time
import urllib.request
import os
from selenium.webdriver.common.by import By


@api_view(['GET'])
def selected_stores(request):
    selected_editor = request.GET.get("editor")
    selected_category = request.GET.get("category")
    editor_num = 0
    store_list = []

    for i in selected_editor:
        editor_num = editor_num + 1
        if i == '1':

            user = Users.objects.get(user_num=editor_num)
            category_num = 0
            for j in selected_category:
                category_num = category_num + 1
                if j == '1':

                    if category_num == 1:
                        category = "한식"
                    elif category_num == 2:
                        category = "중식"

                    elif category_num == 3:
                        category = "일식"
                    elif category_num == 4:
                        category = "양식"

                    try:
                        stores = Stores.objects.filter(
                            user=user, category=category)
                    except:
                        pass
                    obj_num = stores.count()

                    for x in range(obj_num):
                        store = StoreSerializer(stores[x])
                        store_list.append(store.data)

    return Response({"stores": store_list})


@api_view(['GET'])
def random_store(request):
    try:
        token = request.META['HTTP_AUTHORIZATION']
    except:
        return Response({"message": "acceess 토큰 필요함. 로그인 요구"})
    store_num = Stores.objects.count() + 1
    random_num = random.randrange(1, store_num)
    store = Stores.objects.get(id=random_num)
    store = StoreRandomSerializer(store)
    return Response({"random_sotre": store.data})


@api_view(['GET', 'POST'])
def edit(request):
    if request.method == "GET":
        return render(request, 'index.html')
    elif request.method == "POST":
        store = request.POST.get("store_name")
        searching = '홍대' + store
        url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(
            searching)
        headers = {
            "Authorization":  KAKAO_API_KEY
        }
        try:
            places = requests.get(url, headers=headers).json()['documents'][0]
        except:
            return render(request, 'index2.html', {"message": "식당 정보를 불러올 수 없음"})

        data = {}

        data['id'] = places['id']
        data['store_name'] = places['place_name']
        data['main_menu'] = places['category_group_name']
        data['address'] = places['road_address_name']
        data['longitude'] = places['x']
        data['latitude'] = places['y']
        data['time'] = NULL
        data['phone_number'] = places['phone']

        img_folder_path = r".\static\selenium_images"

        if not os.path.isdir(img_folder_path):
            os.mkdir(img_folder_path)

        # 노션에 있는 크롬 드라이버 설치 후 C 드라이브에 저장
        driver = webdriver.Chrome(r"C:\chromedriver.exe")
        driver.get("https://www.google.co.kr/imghp?hl=ko&ogbl")

        search = "홍대" + places['place_name']
        elem = driver.find_element(By.NAME, "q")
        elem.send_keys(search)
        elem.send_keys(Keys.RETURN)

        images = driver.find_elements(By.CSS_SELECTOR, ".rg_i.Q4LuWd")

        for i in range(4):
            try:
                images[i].click()
                time.sleep(2)
                imgUrl = driver.find_element(By.XPATH,
                                             "//*[@id='Sva75c']/div/div/div[3]/div[2]/c-wiz/div/div[1]/div[1]/div[3]/div/a/img").get_attribute('src')
                urllib.request.urlretrieve(
                    imgUrl, f"{img_folder_path}/{places['id']}_{i+1}.jpg")
                print(f"Image saved: {places['id']}_{i+1}.jpg")
            except Exception as e:
                print(e)

        driver.close()

        return render(request, 'index2.html', {'info': data})


@api_view(['POST'])
def save(request):
    info = request.POST.get('info').replace("'", "\"")
    info = json.loads(info)
    user = request.POST.get('user')
    user = Users.objects.get(username=user)
    Stores.objects.create(
        store_name=info['store_name'],
        main_menu=request.POST.get('main_menu'),
        address=info['address'],
        longitude=info['longitude'],
        latitude=info['latitude'],
        time=request.POST.get('time'),
        phone_number=info["phone_number"],
        user=user,
        category=request.POST.get('category')
    )
    return redirect('edit')
