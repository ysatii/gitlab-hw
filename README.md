# Домашнее задание к занятию «Система мониторинга Zabbix» Часть 2` - Мельник Юрий Александрович


## Задание 1

### `Создайте свой шаблон, в котором будут элементы данных, мониторящие загрузку CPU и RAM хоста.`
## `Процесс выполнения`

1. `Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.`
2. `В веб-интерфейсе Zabbix Servera в разделе Templates создайте новый шаблон`
3. `Создайте Item который будет собирать информацию об загрузке CPU в процентах`
4. `Создайте Item который будет собирать информацию об загрузке RAM в процентах`

### `Требования к результату`

1. `Прикрепите в файл README.md скриншот страницы шаблона с названием «Задание 1`



## Решение 1
1. `На машину с именем "zabbix-deb" установим PostgreSQL`
 ```
apt update 

apt install postgresql
 ```

2. `Установим репозиторий Zabbix`
 ```
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb

dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb

apt update
 ```

3. `Установите Zabbix сервер, веб-интерфейс и агент`
 ```
 apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
 ```

4. `Создадим базу данных и пользователя базы данных`
 ```
 su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'123456789\'';"'
 su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"'
 ```
 
 произведем импорт данных
 
 ```
 zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix 
 
 ```
5. `Настроим пароль пользователя в кофигурационном файле /etc/zabbix/zabbix_server.conf`
 ```
 sed -i 's/# DBPassword=/DBPassword=123456789/g' /etc/zabbix/zabbix_server.conf
  ```
  
6. `Настроим пароль пользователя в кофигурационном файле /etc/zabbix/zabbix_server.conf`
 ```
 systemctl restart zabbix-server zabbix-agent apache2
 systemctl enable zabbix-server zabbix-agent apache2 
 ```

![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image1_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image1_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image1_4.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image1_5.jpg)

## Задание 2

### `Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.`


1. `Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.`
2. `Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server`
3. `Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов`
4. `Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera`
5. `Прикрепите за каждым хостом шаблон Linux by Zabbix Agent`
6. `Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов`

### `Требования к результату`


1. `Результат данного задания сдавайте вместе с заданием 3`



## Решение 2
 
1. ` Zabbix Agent`
 ```
 apt update 

 apt install postgresql
 ```

2. `Установим репозиторий Zabbix`
 ```
 wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb

 dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb 

 apt update
 ```
 
3. `Установим репозиторий Zabbix агент`
 ```
 apt install zabbix-agent
 ```

4. `Разрешим доступ с нашего Zabbix сервера`
 ```
 sed -i 's/# Server=127.0.0.1/Server=158.160.110.109/g' /etc/zabbix/zabbix_agentd.conf
 cat /etc/zabbix/zabbix_agentd.conf | grep Server=
 ```
 
5. ` Запустите процесс Zabbix агента `
 ```
 apt install zabbix-agent
 ```

Установим хосты на мониторинг
 
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_3.jpg)


Проверим работоспособность агента
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_5.jpg)

Проверим поступление данных от хостов 
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_6.jpg)

Приведем графики активности одной из машин
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_8.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_9.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_10.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_11.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_12.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_13.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_14.jpg)

Часть лога сервера, подтверждающая что разрешены подключения только с http://158.160.104.145   

![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image2_4.jpg)



## Задание 3

### `Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.`


1. `Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.`
2. `Зайдите в настройки каждого хоста и в разделе Templates прикрепите к этому хосту ваш шаблон`
3. `Так же к каждому хосту привяжите шаблон Linux by Zabbix Agent`
4. `Проверьте что в раздел Latest Data начали поступать необходимые данные из вашего шаблона`
### `Требования к результату`
 Прикрепите в файл README.md скриншот страницы хостов, где будут видны привязки шаблонов с названиями «Задание 2-3». Хосты должны иметь зелёный статус подключения


## Решение 3

## Листинг zbx_export_templates.yaml
## [скачать zbx_export_templates.yaml] (https://github.com/ysatii/gitlab-hw/blob/zabbix/zbx_export_templates.yaml)
 
   
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_11.jpg)


## Задание 4

### `Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.`


1. `Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.`
2. `В разделе Dashboards создайте новый дашборд`
3. `Разместите на нём несколько графиков на ваше усмотрение.`
### `Требования к результату`
 Прикрепите в файл README.md скриншот дашборда с названием «Задание 4»


## Решение 4

## Листинг zbx_export_templates.yaml
## [скачать zbx_export_templates.yaml] (https://github.com/ysatii/gitlab-hw/blob/zabbix/zbx_export_templates.yaml)
 
   
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_11.jpg)


 

