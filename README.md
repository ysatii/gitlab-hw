# Домашнее задание к занятию «GitLab» - `Мельник Юрий Александрович`


## Задание 1

### `Что нужно сделать:`

1. `Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в этом [этом ](https://github.com/netology-code/sdvps-materials/tree/main/gitlab) репозитории.`
2. `Создайте новый проект и пустой репозиторий в нём.Создайте новый проект и пустой репозиторий в нём.Создайте новый проект и пустой репозиторий в нём.`
3. `Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.`

### `В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.`

## Решение 1
1. `GitLab установлен локально, используя Vagrantfile. Подлючимся к машине по ssh`
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_2.jpg)
2. `Создадим новый проект и пустой репозиторий в нём.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_2_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_2_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_2_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_2_4.jpg)
3. `gitlab-runner  в режиме Docker.`
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_3_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_3_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_3_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image1_3_4.jpg)
---

## Задание 2

### `Что нужно сделать:`

1. `Запушьте [репозиторий](https://github.com/netology-code/sdvps-materials/tree/main/gitlab) на GitLab, изменив origin. Это изучалось на занятии по Git.`
2. `Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.`



`В качестве ответа в шаблон с решением добавьте:

   - файл gitlab-ci.yml для своего проекта или вставьте код в соответствующее поле в шаблоне;
   - скриншоты с успешно собранными сборками.
`

## Решение 2
1. `Запушили [репозиторий](https://github.com/netology-code/sdvps-materials/tree/main/gitlab) на GitLab`
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_1_1.jpg)

2. `Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.`

```
stages:
  - test
  - build

test:
  stage: test
  image: golang:1.17
  script: 
   - go test .

static-analysis:
 stage: test
 image:
  name: sonarsource/sonar-scanner-cli
  entrypoint: [""]
 variables:
 script:
  - sonar-scanner -Dsonar.projectKey=my_project -Dsonar.sources=. -Dsonar.host.url=http://gitlab.localdomain:9000 -Dsonar.login=sqp_dc381d34020d1da7e2fa0d969305503b2e949d7f


build:
  stage: build
  image: docker:latest
  script:
   - docker build .

```

![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_4.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_5.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_6.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_2_7.jpg)


`В качестве ответа добавьте в шаблон с решением файл gitlab-ci.yml своего проекта или вставьте код в соответсвующее поле в шаблоне.`

