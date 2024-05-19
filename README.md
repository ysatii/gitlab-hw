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
1. `Создадим свой шаблон`
 Листинг шаблона 
 ```
 zabbix_export:
  version: '6.0'
  date: '2024-05-19T22:04:33Z'
  groups:
    - uuid: 3cd2d0556dad4d3498b2befc0640498d
      name: hw
  templates:
    - uuid: 7326464f637647919f92743de6a2aac2
      template: hw1
      name: hw1
      description: |
        Задание 1 
        1. Создайте Item который будет собирать информацию об загрузке CPU в процентах
        2. Создайте Item который будет собирать информацию об загрузке RAM в процентах
      groups:
        - name: hw
      items:
        - uuid: a7d4adce3b2343f38eec7d4dda619bd5
          name: 'Свободная память в процентах'
          key: my_mem
          delay: 3s
          value_type: FLOAT
          units: '%'
        - uuid: 2a4289a6705b4f8188eb1647b613fa04
          name: 'нагрузка на проценссор в % 1 минута'
          key: 'system.cpu.util[,,avg1]'
          delay: 3s
          value_type: FLOAT
        - uuid: da7eff0744014a2cb8e10cf222e06987
          name: 'Свободная память'
          key: 'vm.memory.size[free]'
          delay: 3s
          units: B
  graphs:
    - uuid: 66027da30715420cbc0d602ec9be246b
      name: 'Нагрузка на проценссор в %'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'system.cpu.util[,,avg1]'
    - uuid: 367628b560af44b098039cde9161ce94
      name: 'Свободная память'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'vm.memory.size[free]'
    - uuid: f587ca786bbb43ad8190d5c0f1e96f3c
      name: 'Свободная память в процентах'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: my_mem
zabbix_export:
  version: '6.0'
  date: '2024-05-19T22:04:33Z'
  groups:
    - uuid: 3cd2d0556dad4d3498b2befc0640498d
      name: hw
  templates:
    - uuid: 7326464f637647919f92743de6a2aac2
      template: hw1
      name: hw1
      description: |
        Задание 1 
        1. Создайте Item который будет собирать информацию об загрузке CPU в процентах
        2. Создайте Item который будет собирать информацию об загрузке RAM в процентах
      groups:
        - name: hw
      items:
        - uuid: a7d4adce3b2343f38eec7d4dda619bd5
          name: 'Свободная память в процентах'
          key: my_mem
          delay: 3s
          value_type: FLOAT
          units: '%'
        - uuid: 2a4289a6705b4f8188eb1647b613fa04
          name: 'нагрузка на проценссор в % 1 минута'
          key: 'system.cpu.util[,,avg1]'
          delay: 3s
          value_type: FLOAT
        - uuid: da7eff0744014a2cb8e10cf222e06987
          name: 'Свободная память'
          key: 'vm.memory.size[free]'
          delay: 3s
          units: B
  graphs:
    - uuid: 66027da30715420cbc0d602ec9be246b
      name: 'Нагрузка на проценссор в %'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'system.cpu.util[,,avg1]'
    - uuid: 367628b560af44b098039cde9161ce94
      name: 'Свободная память'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'vm.memory.size[free]'
    - uuid: f587ca786bbb43ad8190d5c0f1e96f3c
      name: 'Свободная память в процентах'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: my_mem
zabbix_export:
  version: '6.0'
  date: '2024-05-19T22:04:33Z'
  groups:
    - uuid: 3cd2d0556dad4d3498b2befc0640498d
      name: hw
  templates:
    - uuid: 7326464f637647919f92743de6a2aac2
      template: hw1
      name: hw1
      description: |
        Задание 1 
        1. Создайте Item который будет собирать информацию об загрузке CPU в процентах
        2. Создайте Item который будет собирать информацию об загрузке RAM в процентах
      groups:
        - name: hw
      items:
        - uuid: a7d4adce3b2343f38eec7d4dda619bd5
          name: 'Свободная память в процентах'
          key: my_mem
          delay: 3s
          value_type: FLOAT
          units: '%'
        - uuid: 2a4289a6705b4f8188eb1647b613fa04
          name: 'нагрузка на проценссор в % 1 минута'
          key: 'system.cpu.util[,,avg1]'
          delay: 3s
          value_type: FLOAT
        - uuid: da7eff0744014a2cb8e10cf222e06987
          name: 'Свободная память'
          key: 'vm.memory.size[free]'
          delay: 3s
          units: B
  graphs:
    - uuid: 66027da30715420cbc0d602ec9be246b
      name: 'Нагрузка на проценссор в %'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'system.cpu.util[,,avg1]'
    - uuid: 367628b560af44b098039cde9161ce94
      name: 'Свободная память'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'vm.memory.size[free]'
    - uuid: f587ca786bbb43ad8190d5c0f1e96f3c
      name: 'Свободная память в процентах'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: my_mem
zabbix_export:
  version: '6.0'
  date: '2024-05-19T22:04:33Z'
  groups:
    - uuid: 3cd2d0556dad4d3498b2befc0640498d
      name: hw
  templates:
    - uuid: 7326464f637647919f92743de6a2aac2
      template: hw1
      name: hw1
      description: |
        Задание 1 
        1. Создайте Item который будет собирать информацию об загрузке CPU в процентах
        2. Создайте Item который будет собирать информацию об загрузке RAM в процентах
      groups:
        - name: hw
      items:
        - uuid: a7d4adce3b2343f38eec7d4dda619bd5
          name: 'Свободная память в процентах'
          key: my_mem
          delay: 3s
          value_type: FLOAT
          units: '%'
        - uuid: 2a4289a6705b4f8188eb1647b613fa04
          name: 'нагрузка на проценссор в % 1 минута'
          key: 'system.cpu.util[,,avg1]'
          delay: 3s
          value_type: FLOAT
        - uuid: da7eff0744014a2cb8e10cf222e06987
          name: 'Свободная память'
          key: 'vm.memory.size[free]'
          delay: 3s
          units: B
  graphs:
    - uuid: 66027da30715420cbc0d602ec9be246b
      name: 'Нагрузка на проценссор в %'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'system.cpu.util[,,avg1]'
    - uuid: 367628b560af44b098039cde9161ce94
      name: 'Свободная память'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: 'vm.memory.size[free]'
    - uuid: f587ca786bbb43ad8190d5c0f1e96f3c
      name: 'Свободная память в процентах'
      graph_items:
        - color: 1A7C11
          calc_fnc: ALL
          item:
            host: hw1
            key: my_mem
 ```

2. `Произведем настройку агента zabbix, за счет параметров создадим свою метрику свободной памяти на машине`
 листинг  /etc/zabbix/zabbix_agentd.conf.d//my_mem_parameter.conf 
 ```
 UserParameter=my_mem[*], /bin/bash /etc/zabbix/zabbix_agentd.d/my_mem_parameter.sh
 ```
 
 листинг /etc/zabbix/zabbix_agentd.conf.d//my_mem_parameter.sh
 ```
 #!/bin/bash
 # задаем значение переменных по умолчанию
 a=`cat /proc/meminfo | grep MemFree | awk '{print $ 2}'`

 b=`cat /proc/meminfo | grep MemTotal | awk '{print $ 2}'`
 div=`echo "scale=4; $a / $b *100" | bc`
 echo "$div"

 ```
 также необходимо установить пакет bc для вывполения математических операцих с дробными числами
 
 
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1_5.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1_1.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1_2.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1_3.jpg)
![alt text](https://github.com/ysatii/gitlab-hw/blob/zabbix2/img1/image1_4.jpg)
 
## Задание 2

### `Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.`
## `Процесс выполнения`

1. `Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.`
2. `В веб-интерфейсе Zabbix Servera в разделе Templates создайте новый шаблон`
3. `Создайте Item который будет собирать информацию об загрузке CPU в процентах`
4. `Создайте Item который будет собирать информацию об загрузке RAM в процентах`


    Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
    Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server
    Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов
    Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera
    Прикрепите за каждым хостом шаблон Linux by Zabbix Agent
    Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов


### `Требования к результату`

1. `Прикрепите в файл README.md скриншот страницы шаблона с названием «Задание 1`



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


 

