# Пошаговая инструкция: залог для сделок в bitcoin

Bitcoin очень удобен и надёжен для хранения денег, но как проводить в
нём сделки? Традиционные способы включают привлечение доверенной третьей
стороны. Оказывается, bitcoin так могуч, что это вовсе не обязательно.
Ниже я расскажу, как двум людям, не доверяющим друг другу, провернуть
сделку в bitcoin без привлечения третьих сторон.

![esrow](http://i.imgur.com/EwxnELs.png)
![bitcoin](http://i.imgur.com/MFLibRr.jpg)

Сначала рассмотрим существующие способы.

### Перевод bitcoin в обычные деньги для покупки

Пользуясь этим способом, мы полагаемся на существующие юридические
механизмы защиты продавца и покупателя от мошенничества со стороны друг
друга. Нарушается принцип исключения третьих сторон, теряется
возможность анонимности, добавляются комиссии по переводу. Кроме того,
для экономики битконов лучше, чтобы сделки оплачивались непосредственно
в bitcoin.

### Привлечение гаранта

Гарант — третья сторона, которой доверяют обе стороны сделки.
Покупатель отдаёт деньги гаранту, продавец отдаёт товар гаранту, после
чего гарант отдаёт деньги продавцу, а товар — покупателю. Эта схема тоже
не особенно хороша. Репутация гаранта зависит от числа успешных сделок,
а число сделок растёт по мере увеличения репутации. Получается система с
положительной обратной связью, что приводит к сокращению числа гарантов
и централизации системы, от которой хотелось избавиться.

### Как провести сделку без участия третьей стороны

Я веду к тому, что третьим сторонам в сделке вообще не место. Есть
покупатель и продавец, есть система bitcoin. На этой самодостаточной
системе то и дело паразитируют банки, обменники, юристы, гаранты и т.д.
А ведь в протоколе bitcoin всё необходимое для страхования сделок уже
есть.

**Алгоритм очень простой: обе стороны переводят деньги в залог. Если
сделка проходит успешно, залог возвращается, иначе пропадает.**

Для начала нам понадобится познакомиться с понятием
[multisig-адреса](https://en.bitcoin.it/wiki/Address#Multi-signature_addresses).
Для списания денег с multisig-адреса требуется несколько подписей.
Популярны multisig-адреса 2/2 и 2/3. В случае адреса 2/2 нужны две
подписи из двух, в случае 2/3 — две подписи из трёх.

Покупатель и продавец создают multisig-адрес 2/2 и переводят туда
залог. Ни один из них не сможет вернуть залог без согласия другого.
После этого происходит собственно сделка (будем считать что это покупка
товара или оказание услуги за bitcoin). Если сделка завершается успешно
(покупатель получил товар, продавец получил оплату), то участники сделки
забирают залог. Если во время сделки происходит конфликт или кто-то из
участников пропадает, то оба теряют залог.

Участники сделки зависят друг от друга. Риск потерять залог — не менее
сильный аргумент, чем закон, на котором держатся обычные сделки. Не
каждый остановится перед нарушением закона, но никто не захочет потерять
залог. По-моему, в экономике деньги — это самый весомый аргумент. Нет
смысла жульничать, если это заведомо приводит к убыткам.

Чтобы эта схема работала, сумма залога должна превышать цену товара.
Иначе та из сторон, которая первой получит товар или оплату, может
махнуть рукой на залог и пропасть. Мне кажется, что **сумма залога с
каждой стороны должна быть в 2 раза больше цены товара**.

Ещё один подводный камень: когда один участник перевёл залог на
multisig-адрес 2/2, второй участник может пропасть. Получается
некрасивая ситуация: с одной стороны убытки, с другой ничего. К счастью,
bitcoin позволяет застраховаться от подобных недобросовестных клиентов
или шутников — перевод денег на multisig-адрес 2/2 должен проходить
единой транзакцией, подписываемой обоими участниками. Или оба внесут
залог, или никто не внесёт.

Итоговая схема выглядит так:

![](http://i.imgur.com/EwxnELs.png)

Пусть товар стоит 1 BTC. Залог: по 2 BTC с каждой стороны.

1.  Алиса и Боб создают совместный multisig-адрес 2/2, который будет
    использоваться для хранения залога.
2.  Алиса и Боб вместе подписывают транзакцию, которая переводит 2 BTC
    из кошелька Алисы на multisig-адрес и 2 BTC из кошелька Боба на
    multisig-адрес.
3.  Собственно сделка:
    -   Алиса оказывает Бобу услуги стоимостью 1 BTC.
    -   Боб переводит Алисе 1 BTC.
4.  Алиса и Боб забирают залог с multisig-адреса на свои кошельки.

Эта схема с залогом — «обёртка» для любой сделки. Заметим, что все
накладные расходы сводятся к двум транзакциям bitcoin (пополнение залога
и возврат залога). Если учесть ещё две транзакции, пополняющие кошельки,
участвующие в сделке (см. ниже раздел «Подготовка»), то все потери,
связанные с залогом, равны 4-м комиссиям bitcoin, то есть 0.0004 BTC
(примерно 8 рублей по нынешнему курсу). Если сделка требует личного
присутствия участников, то действия, связанные с залогом, могут быть
выполнены до и после личной встречи. Кроме того, участникам сделки будет
комфортней на личной встрече, если они уже связаны залогом, а не просто
посторонние люди. Описанный метод работает и тогда, когда сделка не
требует личной встречи (пример: житель одной страны передаёт
интеллектуальный продукт жителю другой страны). Несколько
последовательных сделок можно защитить одним залогом.

### Практическая реализация

Графические программы, которые я проверил, не предоставляют удобного
интерфейса для проведения двух транзакций, описанных выше (программы
bitcoin-qt и Electrum). Решил поискать веб-решения и практически сразу
нашел веб-клиент [coinbin](https://coinb.in/), основанный на библиотеке
[BitcoinJS](http://bitcoinjs.org/). Клиент не зависит от сервера
разработчика и не хранит ключи удалённо. Кроме того, coinbin можно
[скачать](https://github.com/OutCast3k/coinbin/archive/master.zip) и
использовать локально или загрузить на свой сервер. E-mail и пароль
используются как seed для генерации адреса и не запоминаются. Чтобы
завести несколько адресов, надо использовать несколько пар (E-mail,
пароль). Чтобы не потерять доступ к кошельку, надо делать резервную
копию E-mail и пароля, например в
[KeePassX](https://www.keepassx.org/).

Мне удалось совершить транзакции, необходимые для страхования сделки.
Ниже я приведу пошаговую инструкцию.

#### Подготовка

1.  Алиса и Боб заводят кошельки на coinbin
    ([рис](http://i.imgur.com/xWV35gc.png)).
2.  Смотрят ключи, записывают свои приватные ключи, говорят друг другу
    публичные ключи и адреса
    ([рис](http://i.imgur.com/Bph3789.png)).
3.  Вносят сумму залога на свои адреса coinbin
    (по 0.01 BTC с каждого)
    ([рис](http://i.imgur.com/K8gooL1.png)).
4.  Алиса создаёт multisig 2/2 адрес
    -   Выбирает в меню MultiSig Address
        ([рис](http://i.imgur.com/OivaZnW.png)).
        Открывается такая [форма](http://i.imgur.com/Bdasncz.png).
    -   Заносит в форму публичные ключи себя и Боба
        ([рис](http://i.imgur.com/gAF538K.png)).
    -   Записывает полученный адрес и Redeem Script и передаёт их
        Бобу
        ([рис](http://i.imgur.com/2Tv7AAX.png)).
5.  Боб проверяет Redeem Script
    -   Выбирает раздел Verify
        ([рис](http://i.imgur.com/2NpTwOj.png)).
    -   Вводит Redeem Script и проверяет публичные ключи, адрес и
        Required Signatures = 2
        ([рис](https://i.imgur.com/NtzBRO8.png)).
        **Пояснение**: Боб знает свой публичный адрес, а публичный
        адрес Алисы получил на шаге 2. Адрес кошелька multisig Боб
        получает от Алисы одновременно с Redeem Script. Required
        Signatures — это число подписей, необходимое для совершения
        исходящей транзакции с адреса multisig. В данном случае это
        число равно 2 (участников сделки 2, нужны подписи обоих из
        них).

#### Помещение денег в залог

1.  Алиса подготавливает транзакцию на адрес multisig 2/2 (пополнение залога)
    -   Выбирает в меню Transaction
        ([рис](https://i.imgur.com/WxP9g4i.png)).
    -   Заходит в дополнительные опции, снимает галочку Clear existing
        inputs...
        ([рис](http://i.imgur.com/Rc54mb0.png)).
    -   Заносит в Inputs первый платящий адрес (Алисы)
        ([рис](http://i.imgur.com/qI3TJCH.png)).
    -   Заносит в Inputs второй платящий адрес (Боба)
        ([рис](http://i.imgur.com/sscFtfY.png)).
    -   Заносит в Outputs адрес multisig 2/2 и общую сумму залога за
        вычетом комиссии bitcoin
        ([рис](http://i.imgur.com/0YFlfYd.png)).
    -   Получает Transaction Script и передаёт его Бобу для проверки
        ([рис](http://i.imgur.com/2TZuyXr.png)).

2.  Боб проверяет Transaction Script
    -   Выбирает раздел Verify
        ([рис](http://i.imgur.com/ATPIxC7.png)).
    -   Вводит Transaction Script и находит в Outputs адрес multisig и сумму
        ([рис](http://i.imgur.com/InxmBla.png)).

3.  Алиса и Боб по очереди подписывают Transaction Script
    -   Алиса выбирает раздел Sign
        ([рис](http://i.imgur.com/k0Od2Xr.png)).
    -   Алиса вводит Transaction Script и свой приватный ключ
        ([рис](http://i.imgur.com/k0Od2Xr.png)).
    -   Алиса получает частично подписанную транзакцию и пересылает её Бобу
        ([рис](http://i.imgur.com/MAPOGDv.png)).
    -   Боб снова проверяет транзакцию и убеждается, что адрес
        назначения и сумма не изменились.
    -   Боб доподписывает транзакцию
        (действия аналогичны действиям Алисы, но вводит частично
        подписанную транзакцию)
        ([рис](http://i.imgur.com/qmk1BeT.png)).
    -   Боб снова проверяет транзакцию и убеждается, что колонка
        Signed везде отмечена
        ([рис](https://i.imgur.com/LPxNLvZ.png)).
    -   Боб выбирает раздел Broadcast
        ([рис](http://i.imgur.com/LjWRrSK.png)).
    -   Боб вводит Transaction Script и нажимает Submit
        ([рис](http://i.imgur.com/MtnFVak.png)).


Теперь деньги помещены в залог и можно перейти к сделке как таковой.

#### Возвращение денег из залога

Если сделка сорвалась, то обе стороны теряют залог. (Это и есть
основная идея — заставить другую сторону добросовестно выполнять условия
сделки под страхом потерять залог.) Если сделка завершилась успешно, то
надо вернуть залог — это возможно только с согласия обеих сторон.

1.  Алиса подготавливает транзакцию с адреса multisig 2/2 (возврат
    залога)
    -   Выбирает в меню Transaction
        ([рис](https://i.imgur.com/WxP9g4i.png)).
    -   Удаляет все входы и выходы, оставшиеся от прошлой транзакции
        ([рис](http://i.imgur.com/avIRd4e.png)).
    -   Заносит в первое поле Redeem Script (см. раздел Подготовка)
        ([рис](https://i.imgur.com/jHHdz2P.png)).
    -   Заносит в Outputs получающие адреса Алисы и Боба и суммы
        ([рис](http://i.imgur.com/rf5DaHK.png)).
    -   Получает Transaction Script и передаёт его Бобу для проверки
        ([рис](http://i.imgur.com/DUUzjoO.png)).

2.  Боб проверяет Transaction Script (находит свой получающий адрес и
    сумму)
3.  Алиса подписывает Transaction Script и передаёт Бобу
4.  Боб снова проверяет Transaction Script (находит свой получающий
    адрес и сумму)
5.  Боб подписывает Transaction Script и результат транслирует
    (broadcast)

Деньги перемещены из залога на получающие адреса Алисы и Боба. Сделка
завершена.

### Выводы

Данный алгоритм помогает защититься от мошенничества, так как в случае
оного залог теряют оба. Данная защита не вносит третьих сторон в отличие
от традиционных способов. Накладных расходов почти нет, если не считать
необходимость понять длинный алгоритм и обучить ему другую сторону
сделки. На самом деле ничего сложного там нет: мне потребовалось
провести пару «сделок» с самим собой, чтобы полностью освоиться.

Приветствуются предложения по улучшению алгоритма и ПО,
автоматизирующее алгоритм в большей степени.

### Ссылки

1. [GitHub](https://github.com/OutCast3k/coinbin)
1. Адрес Bitcoin разработчика: 1CWHWkTWaq1K5hevimJia3cyinQsrgXUvg
1. Адрес Bitcoin автора инструкции: 1CsfihQGy5kg3nnTJLzfmNDiPGqiQgdeMz

