# Домашнее задание к занятию «Что такое DevOps. СI/СD» - `Мельник Юрий Александрович`


## Задание 1

### `Что нужно сделать:`

1. `Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.`
2. `Установите на машину с jenkins golang.`
3. `Используя свой аккаунт на GitHub, сделайте себе форк репозитория. В этом же репозитории находится дополнительный материал для выполнения ДЗ.`
4. `Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта go test . и docker build ..`


`В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.`

## Решение 1
1. `Используем виртуальную машину яндекс облака с готовым бразом jenkins.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_1.jpg)

2. `Установим на машину с jenkins golang.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_2.jpg)

3. `Делаем форк нужного репозитория https://github.com/netology-code/sdvps-materials.git  с заданием.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_3.jpg)

4. `Создадим в jenkins Freestyle Project, подключим получившийся репозиторий к нему и произведем запуск тестов и сборку проекта go test . и docker build ..`
### листинг **Freestyle Project** first
```
/usr/local/go/bin/go test .
docker build . -t ubuntu-bionic:8082/hello-world:v$BUILD_NUMBER
```
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_4.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_4_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_4_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img1/image1_4_3.jpg)

---

## Задание 2

### `Что нужно сделать:`

1. `Создайте новый проект pipeline.`
2. `Перепишите сборку из задания 1 на declarative в виде кода.`



`В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.`

## Решение 2
1. `Создадим новый проект pipeline.`
### листинг pipeline my_pipe1
```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git 'https://github.com/netology-code/sdvps-materials.git'}
  }
  stage('Test') {
   steps {
    sh '/usr/local/go/bin/go test .'
   }
  }
  stage('Build') {
   steps {
    sh 'docker build . -t ubuntu-bionic:8082/hello-world:v$BUILD_NUMBER'
   }
  }
 }
}
```
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img2/image2_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img2/image2_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img2/image2_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img2/image2_4.jpg)

### Решение
---

## Задание 3

### `Что нужно сделать:`

1. `Установите на машину Nexus.`
2. `Создайте raw-hosted репозиторий.`
3. `Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.`
4. `Загрузите файл в репозиторий с помощью jenkins.`
 

`В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.`
## Решение 3
### Решение)

## Задание 4

 
## `Что нужно сделать:`

1. `Придумайте способ версионировать приложение, чтобы каждый следующий запуск сборки присваивал имени файла новую версию. Таким образом, в репозитории Nexus будет храниться история релизов.

Подсказка: используйте переменную BUILD_NUMBER.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки`


 
`В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.`
## Решение 4
### Решение 
