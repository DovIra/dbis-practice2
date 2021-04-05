# Довгаль І. КМ-83. Лаб2

## Інструкція

1. Якщо бази даних немає - створити базу и наповнити її скриптом з лаб 1:
- завантажити датасети з сайту https://zno.testportal.com.ua/opendata за 2019 та 2020 роки. Датасети назвати Odata2019File.csv і Odata2020File.csv відповідно
- запустити файл [main.py](https://github.com/DovIra/dbis-practice/blob/main/main.py)
2. Коли база існує:
- змінити конфігурацію flyway під свою БД у conf/flyway.conf
- положити у теку /sql застосунку Flyway скрипти міграції *.sql
- у консолі запустит застосунок Flyway із командою migrate: 'flyway migrate'

## Логічна модель даних
![Логічна](https://github.com/DovIra/dbis-practice2/blob/main/Logical_model.png)

## Фізична модель даних
![Фізична](https://github.com/DovIra/dbis-practice2/blob/main/physic_model.png)

## Статус міграцій бази з результатами ЗНО за 2019 і 2020 роки.
![Результат міграції](https://github.com/DovIra/dbis-practice2/blob/main/migration_info.png)

## Лог міграції бази з результатами ЗНО за 2019 і 2020 роки.
![Результат міграції](https://github.com/DovIra/dbis-practice2/blob/main/migration_log.png)
