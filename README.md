# Ambrelio

Работает так:
Вызываем:
curl -H "Content-Type: application/json" -X POST -d '{"post": {"title":"My article", "content":"Blah blah"}, "login":"John Doe"}' http://localhost:3000/posts

Полуаем результат:
{"id":7,"user_id":14,"title":"My article","content":"Blah blah","ip":"127.0.0.1","created_at":"2016-06-15T19:51:19.531Z","updated_at":"2016-06-15T19:51:19.531Z"}%                   

Ставим оценку посту от 1 до 5:
curl -H "Content-Type: application/json" -X POST -d '{"rating": {"rate":"5"}}' http://localhost:3000/posts/7/rating

Получаем новую среднюю оценку
{"average_rate":4.4}%                 

Получаем Top N постов по среднему рейтингу (n = 2): 
curl -H "Content-Type: application/json" -X GET -d '{"top":"2"}' http://localhost:3000/posts/top

Получаем:
[{"id":7,"user_id":14,"title":"My article","content":"Blah blah","ip":"127.0.0.1","created_at":"2016-06-15T19:51:19.531Z","updated_at":"2016-06-15T19:51:19.531Z"},{"id":2,"user_id":1,"title":"Post 2","content":"Content 2","ip":"192.192.192.192","created_at":"2016-06-15T11:36:15.009Z","updated_at":"2016-06-15T11:41:13.876Z"}]%                                                                                                        
Получаем Top N постов по среднему рейтингу (n = 1):
my_api git:(feature/create-post) ✗ curl -H "Content-Type: application/json" -X GET -d '{"top":"1"}' http://localhost:3000/posts/top

Получаем:
[{"id":7,"user_id":14,"title":"My article","content":"Blah blah","ip":"127.0.0.1","created_at":"2016-06-15T19:51:19.531Z","updated_at":"2016-06-15T19:51:19.531Z"}]%                     
