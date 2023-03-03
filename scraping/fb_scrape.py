from selenium import webdriver
from parsel import Selector
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from bs4 import BeautifulSoup
import time
import pandas as pd


chrome_options = webdriver.ChromeOptions()
prefs = {"profile.default_content_setting_values.notifications" : 2}
chrome_options.add_experimental_option("prefs",prefs)
from selenium.webdriver.support.wait import WebDriverWait

driver = webdriver.Chrome('H:/chromedriver.exe',chrome_options=chrome_options)
content_list=[]
name_list=[]
#open the webpage
driver.get("https://wwww.facebook.com/")

#target username
username = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='email']")))
password = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='pass']")))

#enter username and password
username.clear()

#enter the email or mobile no for login into fb
username.send_keys("email or mobile no")
password.clear()
#use your username and password
#enter your fb account password
password.send_keys("passwd")

#target the login button and click it
time.sleep(5)
button = WebDriverWait(driver,5).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

#We are logged in!
print("Logged in")
#program to parse user name who posted comment
# Searchbox = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, "//input[@type='search']")))
# Searchbox.clear()
# keyword="#realestate"
# Searchbox.send_keys(keyword)
# Searchbox.send_keys(Keys.ENTER)
time.sleep(5)
driver.get("https://www.facebook.com/groups/1225966920763001")

time.sleep(4)
while True:
    soup=BeautifulSoup(driver.page_source,"html.parser")
    df = pd.DataFrame()
    all_posts=soup.find_all("div",{"class":"x1yztbdb x1n2onr6 xh8yej3 x1ja2u2z"})
    for post in all_posts:
        try:
            name=post.find("a",{"class":"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv xzsf02u x1s688f"}).text
        except:
            name="not found"
        print("-----------------------")
        print(name)
        try:
            content=post.find("span",{"class":"x193iq5w xeuugli x13faqbe x1vvkbs x1xmvt09 x1lliihq x1s928wv xhkezso x1gmr53x x1cpjm7i x1fgarty x1943h6x xudqn12 x3x7a5m x6prxxf xvq8zen xo1l8bm xzsf02u"}).text    
        except:
            content="not found"
        print(content)
        print("-------------------------") 
        content_list.append(content)
        name_list.append(name)
        df=pd.DataFrame({"name":name_list,"content":content_list})    
        df.drop_duplicates(subset="content",keep="first",inplace=True)
        df.to_csv("fb_data3.21.csv")
        if df.shape[0]>10:
            break
    if df.shape[0]>10:
        break
    time.sleep(5)
    #scroll 
    y=500
    for timer in range(0,25):
        driver.execute_script("window.scrollTo(0,"+str(y)+")")   
        y+=500
        time.sleep(3) 
        
