import requests
from bs4 import BeautifulSoup

def fetch_news_from_b3():
    
    url = "https://www.b3.com.br/pt_br/noticias/"
    
   
    response = requests.get(url)

    
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        
        
        headlines = soup.find_all('h2', class_='news-headline')
        
        news_list = []
        for headline in headlines:
            news_list.append(headline.get_text())
        
        return news_list
    else:
        print("Falha ao acessar o site")
        return []

# Exemplo de chamada da função
if __name__ == "__main__":
    news = fetch_news_from_b3()
    for item in news:
        print(item)
