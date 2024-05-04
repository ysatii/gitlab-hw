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
### Листинг pipeline my_pipe1
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

---

## Задание 3

### `Что нужно сделать:`

1. `Установите на машину Nexus.`
2. `Создайте raw-hosted репозиторий.`
3. `Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.`
4. `Загрузите файл в репозиторий с помощью jenkins.`
 

`В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.`
## Решение 3
1. `Установите на машину Nexus. установка произведена на машину яндекс облака`
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_1.jpg)

2. `Создадим raw-hosted репозиторий.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_2.jpg)

3. `Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.`

### Листинг pipepline
```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git 'https://github.com/netology-code/sdvps-materials.git'}
  }
  stage('Run tests') {
            steps {
                sh '/usr/local/go/bin/go test .'
            }
  }
  stage('bilding ') {
   steps {
    sh 'CGO_ENABLED=0 GOOS=linux /usr/local/go/bin/go build -a -installsuffix nocgo -o ./appv .'
   }
  }
 }
}
```
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_3_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_3_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_3_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_3_4.jpg)

4. `Загрузите файл в репозиторий с помощью jenkins.`
### Листинг pipepline
```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git 'https://github.com/netology-code/sdvps-materials.git'}
  }
  stage('Run tests') {
            steps {
                sh '/usr/local/go/bin/go test .'
            }
  }
  stage('bilding ') {
   steps {
    sh 'CGO_ENABLED=0 GOOS=linux /usr/local/go/bin/go build -a -installsuffix nocgo -o ./appv .'
   }
  }
   stage('push to Nexus repo') {
    steps {
     sh 'curl -u admin:1234 http://ubuntu-bionic:8081/repository/raw-hosted/ --upload-file ./appv -v'
    }
  }
 }
}
```
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_4.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_4_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img3/image3_4_2.jpg)
 



## Задание 4

 
## `Что нужно сделать:`

1. `Придумайте способ версионировать приложение, чтобы каждый следующий запуск сборки присваивал имени файла новую версию. Таким образом, в репозитории Nexus будет храниться история релизов.

Подсказка: используйте переменную BUILD_NUMBER.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки`



## Решение 4

1. `Самое оптимальное решение изменить скрпит пунта 4.4 приписав перменную $BUILD_NUMBER` к имени выходного файла ./appv$BUILD_NUMBER`

Листинг предлагаемого решения

```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git 'https://github.com/netology-code/sdvps-materials.git'}
  }
  stage('Run tests') {
            steps {
                sh '/usr/local/go/bin/go test .'
            }
  }
  stage('bilding ') {
   steps {
    sh 'CGO_ENABLED=0 GOOS=linux /usr/local/go/bin/go build -a -installsuffix nocgo -o Самый .'
   }
  }
   stage('push to Nexus repo') {
    steps {
     sh 'curl -u admin:1234 http://ubuntu-bionic:8081/repository/raw-hosted/ --upload-file ./appv$BUILD_NUMBER -v'
    }
  }
 }
}
```
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img4/image4_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img4/image4_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img4/image4_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/ci-cd/img4/image4_4.jpg)


