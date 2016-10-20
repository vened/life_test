# README

## Запуск проекта
`rails s`
`bundle exec sidekiq`

Cбор новостей из различных rss лент запускается rake таском 
 
`bin/rake 'parse[*/15 * * * *, https://rg.ru/xml/index.xml]'`
 
где первым агументом передается периодичность обновления,
вторым url rss ленты новостей,
если аргументов нет то создается задание в котолром по умолчанию раз в 5 минут собираются новости c lenta.ru

`bin/rake 'parse'`
 
Список задач можно посмотреть в веб интерфейсе http://localhost:3000/sidekiq/cron


## API
`http://localhost:3000/api/v0/articles.json
http://localhost:3000/api/v0/articles.json?limit=3&offset=2
http://localhost:3000/api/v0/articles.json?limit=3&offset=1&search=Маленький Фил
http://localhost:3000/api/v0/articles/3`