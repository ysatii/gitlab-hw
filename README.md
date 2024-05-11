# Домашнее задание к занятию «Система мониторинга Zabbix»`


## Задание 1

### `Установите Zabbix Server с веб-интерфейсом.`
## `Процесс выполнения`

1. `Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.`
2. `Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11`
3. `Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.`
4. `Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.`

### `Требования к результату`

1. `Прикрепите в файл README.md скриншот авторизации в админке.`
2. `Приложите в файл README.md текст использованных команд в GitHub.`

### Подготовим 3 машины на яндекс облаке, первую будем использовать в роли Zabbix Server, остальные будут клиентами, на них будет установлен агент 
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image1_1.jpg)

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

### `Установите Zabbix Agent на два хоста.`


1. `Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.`
2. `Установите Zabbix Agent на 2 вирт.машины, одной из них может быть ваш Zabbix Server.`
3. `Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов.`
4. `Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera.`
5. `Проверьте, что в разделе Latest Data начали появляться данные с добавленных агентов.`

### `Требования к результату`


1. `Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу`
2. `Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером`
3. `Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.`
4. `Приложите в файл README.md текст использованных команд в GitHub`



## Решение 2
1. `Опишем команды для установки Zabbix Agent`
 ```
 sed -i 's/# DBPassword=/DBPassword=123456789/g' /etc/zabbix/zabbix_server.conf
  ```


![alt text](https://github.com/ysatii/gitlab-hw/blob/gitlab/img1/image2_1_1.jpg)

 

```
```


## Задание 3

### `Установите Zabbix Agent на Windows (компьютер) и подключите его к серверу Zabbix.`


1. `Приложите в файл README.md скриншот раздела Latest Data, где видно свободное место на диске C:`
 

## Решение 3
1. Для выполнения задания нам понадобться создать свой шаблон для виндовс машин, при необходимости можно сделать импорт
   Создаем 4 айтемсс
 * DiskFree  - свободное пространство
 * DiskPFree - свободносе пространство в процентах
 * DiskTotal - полный размер диска
 * DiskUsed - используемое пространство

2. Тригеры
 * Меньше 1ГБ свободно на системном диске компьютера {HOST.NAME}  - команда last(/Check-Disks-Windows/vfs.fs.size["c:",free])<1000M
 * Меньше 10% свободно на системном диске компьютера {HOST.NAME}  - команда last(/Check-Disks-Windows/vfs.fs.size["c:",pfree])<10
 * Меньше 20% свободно на системном диске компьютера {HOST.NAME}  - команда last(/Check-Disks-Windows/vfs.fs.size["c:",pfree])<20
 * Меньше 100 Мб свободно на системном диске компьютера {HOST.NAME}  - команда last(/Check-Disks-Windows/vfs.fs.size["c:",free])<100M

3. Графики
 * Cвободное место на диске в процентах
 * Использующий объём диска
 * Общий объём диска
 * Свободное место на диске
          


## Листинг zbx_export_templates.yaml

 ```
 zabbix_export:
   version: '6.0'
   date: '2024-05-10T20:31:20Z'
   groups:
     - uuid: f20d578818804cfb952cdee4326c0329
       name: Templates/Check-Disks-Windows
   templates:
     - uuid: e4c7234d26f448c4b02ad470c6c6fb24
       template: Check-Disks-Windows
       name: Check-Disks-Windows
       groups:
         - name: Templates/Check-Disks-Windows
       items:
         - uuid: 8e88f1a3cff9403ab664533a64949152
           name: DiskFree
           key: 'vfs.fs.size["c:",free]'
           units: B
           triggers:
              - uuid: 61f7a06f15f34407b11a08ee99fa340b
               expression: 'last(/Check-Disks-Windows/vfs.fs.size["c:",free])<1000M'
               name: 'Меньше 1ГБ свободно на системном диске компьютера {HOST.NAME}'
               manual_close: 'YES'
             - uuid: ca83267ad7fe463790442c4506a43cc1
               expression: 'last(/Check-Disks-Windows/vfs.fs.size["c:",free])<100M'
               name: 'Меньше 100 Мб свободно на системном диске компьютера {HOST.NAME}'
               manual_close: 'YES'
         - uuid: cabfc19059054af6b74c160ba306bf46
           name: DiskPFree
           key: 'vfs.fs.size["c:",pfree]'
           value_type: FLOAT
           units: '%'
           triggers:
             - uuid: 20343a3373ae4e5dbba57c1c3db2a37b
               expression: 'last(/Check-Disks-Windows/vfs.fs.size["c:",pfree])<10'
               name: 'Меньше 10% свободно на системном диске компьютера {HOST.NAME}'
               manual_close: 'YES'
             - uuid: 052b9ce585c74bd29bcd8f4595241d6a
               expression: 'last(/Check-Disks-Windows/vfs.fs.size["c:",pfree])<20'
               name: 'Меньше 20% свободно на системном диске компьютера {HOST.NAME}'
               manual_close: 'YES'
         - uuid: 8ca937634b774c42a2ac5ba786d915a5
           name: DiskTotal
           key: 'vfs.fs.size["c:",total]'
           units: B
         - uuid: 546f37335d5e400db0dc50c21ff90998
           name: DiskUsed
           key: 'vfs.fs.size["c:",used]'
           units: B
   graphs:
     - uuid: 98273272c0554ce38799e9c9d2af12fe
       name: 'Cвободное место на диске в процентах'
       graph_items:
         - color: 1A7C11
           calc_fnc: ALL
           item:
             host: Check-Disks-Windows
             key: 'vfs.fs.size["c:",pfree]'
     - uuid: 341a08d6c46b4c8cb938020b79cf8771
       name: 'Использующий объём диска'
       graph_items:
         - color: 1A7C11
           calc_fnc: ALL
           item:
             host: Check-Disks-Windows
             key: 'vfs.fs.size["c:",used]'
     - uuid: 36a2a683633f4fe5a4e7d1fd7b6b6df5
       name: 'Общий объём диска'
       graph_items:
         - color: 1A7C11
           calc_fnc: ALL
           item:
             host: Check-Disks-Windows
             key: 'vfs.fs.size["c:",total]'
     - uuid: 5f0e40f7a31e4bb69cc2df0f54508da6
       name: 'Свободное место на диске'
       graph_items:
         - color: 1A7C11
           calc_fnc: ALL
           item:
             host: Check-Disks-Windows
             key: 'vfs.fs.size["c:",free]'

 ```
 
Произведем тесты написанных скриптов, заполним диск С, оставив миниммум свободного места   
потом освободим его, это позволит получить подробные графики и лучше понять систему мониторинга!



1. `Установим агент на операционную систему Windows   `
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_2.jpg)

2. `Откроем порт агента Zabbix для доступа из интернета, я арендую внешний адрес у провайдера!`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_3.jpg)

3. `Файловая система компютера до теста файлового пространства`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_4.jpg)

4. `Файловая система компютера вовремя теста файлового пространства`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_5.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_6.jpg)

5. `файловая система компьютера вовремя теста файлового пространства`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_7.jpg)

6. `Получили оповещения о проблемах с файловым пространством`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_8.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_9.jpg)

7. `Графики изменеия файлового пространства во время теста`
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_10.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_11.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix/img1/image3_11.jpg)


 

