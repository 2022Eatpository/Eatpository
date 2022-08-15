import selenium
from selenium import webdriver
from urllib.request import urlopen
from selenium.webdriver.common.keys import Keys
import time
import urllib.request
import os

# Backend/static/selenium_images/ 폴더를 만들고
# 본인 컴퓨터의 폴더 경로를 복붙.
img_folder_path = r"C:\Users\danha\Documents\GitHub\Eatpository\Backend\static\selenium_images"

if not os.path.isdir(img_folder_path):
    os.mkdir(img_folder_path)

driver = webdriver.Chrome()
driver.get("https://www.google.co.kr/imghp?hl=ko&ogbl")

search = "홍대" + "카미야"
elem = driver.find_element_by_name("q")
elem.send_keys(search)
elem.send_keys(Keys.RETURN)

images = driver.find_elements_by_css_selector(".rg_i.Q4LuWd")

for i in range(4):
    try:
        images[i].click()
        time.sleep(2)
        imgUrl = driver.find_element_by_xpath(
            "//*[@id='Sva75c']/div/div/div[3]/div[2]/c-wiz/div/div[1]/div[1]/div[3]/div/a/img").get_attribute('src')
        urllib.request.urlretrieve(
            imgUrl, f"{img_folder_path}/{search}_{i+1}.jpg")
        print(f"Image saved: {search}_{i+1}.jpg")
    except Exception as e:
        print(e)

driver.close()
