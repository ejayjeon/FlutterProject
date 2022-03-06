import requests
from bs4 import BeautifulSoup
import telegram
import datetime
import pytz
import sched
from apscheduler.schedulers.blocking import BlockingScheduler
# 고정부분
url = 'https://finance.naver.com/sise/ipo.naver'
html = requests.get(url)
soup = BeautifulSoup(html.text, 'html.parser')
bot = telegram.Bot(token = '5124537666:AAEvpm0nbrVsoHnsNDpg8F6ohi1evMBcNLI')
now = datetime.datetime.now(pytz.timezone('Asia/Seoul'))
month = now.month
dates = soup.select('li.area_private > span.num')
for date in dates:
    thismonth = int(date.text.strip()[4:5])


gongmo_lists = soup.find_all('div', class_="item_area")
for gongmo_list in gongmo_lists:
    gongmo_title = gongmo_list.find('h4', class_='item_name').text[4:].strip()
    gongmo_price = gongmo_list.find('li', class_='area_price').text[4:].strip()
    gongmo_part = gongmo_list.find('li', class_='area_type').text[3:].strip()
    gongmo_host = gongmo_list.find('li', class_='area_sup').text[4:].strip()
    gongmo_date = gongmo_list.find('li', class_='area_private').text[5:].strip()
    gongmo_listdate = gongmo_list.find('li', class_='area_list').text[4:].strip()
    if(int(gongmo_date[4:5]) == month):
        bot.sendMessage(chat_id=5127069833, text='회사명: ' + gongmo_title + '(' + gongmo_part + ')' + ' / 공모가(예상): ' +  gongmo_price + ' / 주관사: ' + gongmo_host + ' / 개인청약일: ' + gongmo_date + ' / 상장일: ' +gongmo_listdate)
    


