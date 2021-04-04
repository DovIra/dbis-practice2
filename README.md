# Довгаль І. КМ-83. Лаб2

## Інструкція

1. Якщо бази даних немає - створити базу и наповнити її скриптом з лаб1:
- завантажити датасети з сайту https://zno.testportal.com.ua/opendata
- запустити файл main.py
2. Коли база існує:
- змінити конфігурацію flyway під свою БД у conf/flyway.conf
- положити у теку /sql  застосунку Flyway скрипти міграції
- у консолі запустит застосунок Flyway із командою migrate

## Логічна модель даних
![Логічна](https://github.com/DovIra/dbis-practice2/blob/main/Logical_model.png)

## Фізична модель даних
![Фізична](https://github.com/DovIra/dbis-practice2/blob/main/physic_model.png)

## Лог міграцій бази результатів 2019 і 2020 років із попередньої лабороторної роботи
