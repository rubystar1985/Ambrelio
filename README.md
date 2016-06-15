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
