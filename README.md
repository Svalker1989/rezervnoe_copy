# Домашнее задание к занятию "`Резервное копирование`" - `Стрекозов Владимир`

### Задание 1
* Составьте команду rsync, которая позволяет создавать зеркальную копию домашней директории пользователя в директорию /tmp/backup
* Необходимо исключить из синхронизации все директории, начинающиеся с точки (скрытые)
* Необходимо сделать так, чтобы rsync подсчитывал хэш-суммы для всех файлов, даже если их время модификации и размер идентичны в источнике и приемнике.
* На проверку направить скриншот с командой и результатом ее выполнения
### Скриншот с командой и результатом выполнения
![](https://github.com/Svalker1989/rezervnoe_copy/blob/main/Z1.PNG)
---

### Задание 2
* Написать скрипт и настроить задачу на регулярное резервное копирование домашней директории пользователя с помощью rsync и cron.
* Резервная копия должна быть полностью зеркальной
* Резервная копия должна создаваться раз в день, в системном логе должна появляться запись об успешном или неуспешном выполнении операции
* Резервная копия размещается локально, в директории /tmp/backup
* На проверку направить файл crontab и скриншот с результатом работы утилиты.
### Файл contab
[Файл contab](https://github.com/Svalker1989/rezervnoe_copy/blob/main/rsync_cron.sh)
### Скриншот с результатом выполнения
![](https://github.com/Svalker1989/rezervnoe_copy/blob/main/Z2.PNG)
---

## Дополнительные задания (со звездочкой*)
### Задание 3
* Настройте ограничение на используемую пропускную способность rsync до 1 Мбит/c
* Проверьте настройку, синхронизируя большой файл между двумя серверами
* На проверку направьте команду и результат ее выполнения в виде скриншота
### Скриншот с результатом выполнения
![](https://github.com/Svalker1989/rezervnoe_copy/blob/main/Z3.PNG)
---

### Задание 4
* Напишите скрипт, который будет производить инкрементное резервное копирование домашней директории пользователя с помощью rsync на другой сервер
* Скрипт должен удалять старые резервные копии (сохранять только последние 5 штук)
* Напишите скрипт управления резервными копиями, в нем можно выбрать резервную копию и данные восстановятся к состоянию на момент создания данной резервной копии.
* На проверку направьте скрипт и скриншоты, демонстрирующие его работу в различных сценариях.
### Файл скрипта
[Файл скрипта](https://github.com/Svalker1989/rezervnoe_copy/blob/main/rsync_incremental.sh)
### Скриншоты выполнения скрипта
![](https://github.com/Svalker1989/rezervnoe_copy/blob/main/Z4.PNG)
#### К сожалению не осилил как сделать инкрементный бэкап от каждого последующего бэкапа в цепочке из 5 бэкапов. Пробовал и ключи --backup --backup-dir=DIR, но папка с --backup-dir= всё время пустая. С ключом --link-dest=DIR так же не успел разобраться. Поэтому каждый из 5 бэкапов у меня по сути это фульник.
