
#R로 웹 데이터를 가져오는 4가지 방법(웹크롤링)

#웹에 있는 데이터를 가져오는 단계 : 요청 -> 추출 -> 저장 -> 반복 -> 예외처리 -> 최적화

install.packages("rvest")
library(rvest)

#xml_document라고 하는 r class로 만드는 과정
tar <- "https://news.naver.com/main/ranking/read.nhn?mid=etc&sid1=111&rankingType=popular_day&oid=052&aid=0001321181&date=20190720&type=2&rankingSeq=6&rankingSectionId=100"
read_html(tar)

# read_html(tar) %>% html_nodes("tag.class") 
read_html(tar) %>% html_nodes("h3") #tar html을 읽어서 그 중 h3라는 tag를 가져옵니다.

read_html(tar) %>% html_nodes("h3[id = 'articleTitle']") #h3 중에서도 id = 'articleTitle' 부분을 가져옵니다
read_html(tar) %>% html_nodes("h3#articleTitle")  #이렇게 가져와도 되고ㅎㅎ
#read_html(tar) %>% html_nodes("h3.articleTitle")  class는 .으로 표시    이거는 class가 있을 경우
read_html(tar) %>% html_nodes("h3#articleTitle") %>% html_text()    #text만 가져오도록!

read_html(tar) %>% html_nodes("h3#articleTitle") %>% html_attr("id")
#보통 attr은 기사에서 추가적인 정보를 가져오기 위해 링크가 필요한데 이때 attr로 하이퍼링크 값을 가져오도록 한다. 그 기사의 하이퍼링크는 그 전페이지에서 링크제목 오른쪽 버튼 클릭-> 검사를 통해 가져올 수 있다. href = 이게 보통은 하이퍼링크를 뜻함.

tar1 <- "https://news.naver.com/"  #원하는 링크가 있는 페이지
read_html(tar1) %>% html_nodes("a") #a태그는 관례적으로 달고 있어서 엄청 많음..
read_html(tar1) %>% html_nodes("li a") #부모자식 노드 개념 이용. li밑의 a를 보여주세요
read_html(tar1) %>% html_nodes("li a") %>% html_attr("href")    
    
    
    
    
    