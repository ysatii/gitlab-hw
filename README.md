# Домашнее задание к занятию «Git» - `Мельник Юрий Александрович`


## Задание 1

### `Что нужно сделать:`

1. `Зарегистрируйте аккаунт на GitHub.`
2. `Создайте новый отдельный публичный репозиторий. Обязательно поставьте галочку в поле «Initialize this repository with a README»`
3. `Склонируйте репозиторий, используя https протокол git clone ... .`
4. `Перейдите в каталог с клоном репозитория.`
5. `Произведите первоначальную настройку Git, указав своё настоящее имя и email: git config --global user.name и git config --global user.email johndoe@example.com.`
6. `Выполните команду git status и запомните результат.`
7. `Отредактируйте файл README.md любым удобным способом, переведя файл в состояние Modified.`
8. `Ещё раз выполните git status и продолжайте проверять вывод этой команды после каждого следующего шага.`
9. `Посмотрите изменения в файле README.md, выполнив команды git diff и git diff --staged.`
10. `Переведите файл в состояние staged или, как говорят, добавьте файл в коммит, командой git add README.md.`
11. `Ещё раз выполните команды git diff и git diff --staged.`
12. `Теперь можно сделать коммит git commit -m 'First commit'.`
13. `Сделайте git push origin master.`

`В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.`

## Решение 1

### [Ссылка на коммиит в ветке master ](https://github.com/ysatii/git1/commit/ea4dde5d998b5abd1d8c07dd0784a2c9326e9a41)

---

## Задание 2

### `Что нужно сделать:`

1. `Создайте файл .gitignore (обратите внимание на точку в начале файла) и проверьте его статус сразу после создания.`
2. `Добавьте файл .gitignore в следующий коммит git add....`
3. `Напишите правила в этом файле, чтобы игнорировать любые файлы .pyc, а также все файлы в директории cache.`
4. `Сделайте коммит и пуш.`


`В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.`

## Решение 2
### [Ссылка на коммиит, создан .gitignore ](https://github.com/ysatii/git1/commit/362ca2041f3db3155806f95f4734a683ccd62b1b)
---

## Задание 3

### `Что нужно сделать:`

1. `Создайте новую ветку dev и переключитесь на неё.`
2. `Создайте в ветке dev файл test.sh с произвольным содержимым.`
3. `Сделайте несколько коммитов и пушей в ветку dev, имитируя активную работу над файлом в процессе разработки.`
4. `Переключитесь на основную ветку.`
5. `Добавьте файл main.sh в основной ветке с произвольным содержимым, сделайте комит и пуш . Так имитируется продолжение общекомандной разработки в основной ветке во время разработки отдельного функционала в dev ветке.`
6. `Сделайте мердж dev ветки в основную с помощью git merge dev. Напишите осмысленное сообщение в появившееся окно комита.`
7. `Сделайте пуш в основной ветке.`
8. `Не удаляйте ветку dev.`

 
 

`В качестве ответа прикрепите ссылку на граф коммитов https://github.com/ваш-логин/ваш-репозиторий/network в ваш md-файл с решением.`
## Решение 3
### [график коммитов](https://github.com/ysatii/git1/network)

## Задание 3

### `Сэмулируем конфликт. Перед выполнением изучите документацию..`
## `Что нужно сделать:`

1. `Создайте ветку conflict и переключитесь на неё.`
2. `Внесите изменения в файл test.sh.`
3. `Сделайте коммит и пуш.`
4. `Переключитесь на основную ветку.`
5. `Измените ту же самую строчку в файле test.sh.`
6. `Сделайте коммит и пуш.`
7. `Сделайте мердж ветки conflict в основную ветку и решите конфликт так, чтобы в результате в файле оказался код из ветки conflict.`

 
`В качестве ответа на задание прикрепите ссылку на граф коммитов https://github.com/ваш-логин/ваш-репозиторий/network в ваш md-файл с решением.`
## Решение 4
### [график коммитов](https://github.com/ysatii/git1/network)
