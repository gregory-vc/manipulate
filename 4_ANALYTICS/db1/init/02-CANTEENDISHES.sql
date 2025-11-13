--CANTEENDISHES...
CREATE TABLE IF NOT EXISTS public.canteendishes
(
    dishid integer NOT NULL,
    dishname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dishtype integer,
    cookid integer,
    price numeric(8,2),
    CONSTRAINT con_dishid PRIMARY KEY (dishid)
)

TABLESPACE pg_default;


--DEPARTAMENT...
CREATE TABLE IF NOT EXISTS public.departament
(
    departamentid integer NOT NULL,
    departamentname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT con_departamentid PRIMARY KEY (departamentid)
)

TABLESPACE pg_default;

--DISHTYPE...
CREATE TABLE IF NOT EXISTS public.dishtype
(
    dishtype integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT con_dishtype PRIMARY KEY (dishtype)
)

TABLESPACE pg_default;

--FILIAL...
CREATE TABLE IF NOT EXISTS public.filial
(
    filialid integer NOT NULL,
    filialname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT con_filialid PRIMARY KEY (filialid)
)

TABLESPACE pg_default;


--PERSONCANTEENORDER...
CREATE TABLE IF NOT EXISTS public.personcanteenorder
(
    personid integer,
    dateorder date,
    dishid integer
)

TABLESPACE pg_default;


--personcars
CREATE TABLE IF NOT EXISTS public.personcars
(
    personid integer,
    carregnumber character varying(100) COLLATE pg_catalog."default",
    carname character varying(100) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;


--PERSONPAYMENTS...
CREATE TABLE IF NOT EXISTS public.personpayments
(
    personid integer,
    sum numeric(10,2),
    period date
)

TABLESPACE pg_default;


--PERSONS...
CREATE TABLE IF NOT EXISTS public.persons
(
    personid integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    birthdate date,
    departamentid integer,
    filialid integer,
    CONSTRAINT con_persons_tabnum PRIMARY KEY (personid)
)

TABLESPACE pg_default;

--PERSONSEXTERNAL...
CREATE TABLE IF NOT EXISTS public.personsexternal
(
    id integer NOT NULL,
    fio character varying(100) COLLATE pg_catalog."default",
    departamentid integer,
    contact_mobile_phone character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT personsexternal_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

--PHONES...
CREATE TABLE IF NOT EXISTS public.phones
(
    phoneid integer NOT NULL,
    personid integer,
    phone_type character varying(100) COLLATE pg_catalog."default",
    phone_number character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT phones_pkey PRIMARY KEY (phoneid)
)

TABLESPACE pg_default;

insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (1, 'Компот из яблок', 1, 18, 20);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (2, 'Компот из абрикосов', 1, 18, 28);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (3, 'Компот из слив', 1, 21, 25);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (4, 'Мин.вода "Бон аква"', 1, null, 18);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (5, 'Мин.вода "Шишкин лес"', 1, null, 12);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (6, 'Сок "J7" в ассортименте', 1, null, 20);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (7, 'Суп гороховый', 2, 18, 50);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (8, 'Щи', 2, 19, 50);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (9, 'Борщ', 2, 19, 50);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (10, 'Суп овощной', 2, 20, 45);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (11, 'Крем-суп из шампиньонов', 2, 21, 55);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (12, 'Суп из морепродуктов', 2, 18, 48);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (13, 'Суп куриный', 2, 19, 46);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (14, 'Бефстроганоф', 3, 19, 98);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (15, 'Сосиски отварные', 3, 20, 55);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (16, 'Бедро куриное', 3, 20, 80);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (17, 'Рыба жаренная', 3, 19, 102.8);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (18, 'Гуляш из говядины', 3, 21, 110.6);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (19, 'Котлета жаренная', 3, 18, 78.2);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (20, 'Стейк из семги', 3, 18, 88.2);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (21, 'Макароны', 4, 19, 36);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (22, 'Смесь золотистого и дикого риса', 4, 20, 44.8);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (23, 'Гречневая каша', 4, 19, 42.2);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (24, 'Картофельное пюре', 4, 21, 40);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (25, 'Картофель по-русски', 4, 21, 58.2);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (26, 'Плов', 4, 21, 68.4);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (27, 'Яблочный штрудель', 5, 18, 60.2);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (28, 'Тирамиссу', 5, null, 140.5);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (29, 'Творожная запеканка', 5, 20, 96.4);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (30, 'Булочка с маком', 5, null, 48.9);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (31, 'Булочка с творогом', 5, 19, 52.3);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (32, 'Пирожное "муравейник"', 5, 18, 52);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (33, 'Пирожное вишневое', 5, null, 68.5);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (34, 'Салат оливье', 6, 18, 40.5);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (35, 'Салат морковный', 6, 18, 38.4);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (36, 'Салат весенний', 6, 21, 48.9);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (37, 'Сельдь под шубой', 6, 18, 59.6);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (38, 'Салат греческий', 6, 19, 60.4);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (39, 'Салат крабовый', 6, 20, 50.4);
insert into CANTEENDISHES (dishid, dishname, dishtype, cookid, price)
values (40, 'Салат "мостик"', 6, 20, 48.4);


insert into DEPARTAMENT (departamentid, departamentname)
values (1, 'Бухгалтерия');
insert into DEPARTAMENT (departamentid, departamentname)
values (2, 'Менеджмент');
insert into DEPARTAMENT (departamentid, departamentname)
values (3, 'Отдел кадров');
insert into DEPARTAMENT (departamentid, departamentname)
values (4, 'Хозяйственный отдел');
insert into DEPARTAMENT (departamentid, departamentname)
values (5, 'Столовая');


insert into DISHTYPE (dishtype, name)
values (1, 'Напитки');
insert into DISHTYPE (dishtype, name)
values (2, 'Первое блюдо');
insert into DISHTYPE (dishtype, name)
values (3, 'Второе блюдо');
insert into DISHTYPE (dishtype, name)
values (4, 'Гарнир');
insert into DISHTYPE (dishtype, name)
values (5, 'Десерт');
insert into DISHTYPE (dishtype, name)
values (6, 'Салат');


insert into FILIAL (filialid, filialname)
values (1, 'Москва');
insert into FILIAL (filialid, filialname)
values (2, 'Санкт-Петербург');
insert into FILIAL (filialid, filialname)
values (3, 'Нижний Новгород');
insert into FILIAL (filialid, filialname)
values (4, 'Ярославль');


--PERSONCANTEENORDER...
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-01-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-01-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-01-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-01-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-01-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-01-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-01-2019', 'dd-mm-yyyy'), 9);

--100 records committed...
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-01-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-01-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-01-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-01-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-01-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-01-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-01-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-01-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-01-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-01-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-01-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-01-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-01-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-01-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-01-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-01-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-01-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-01-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-01-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-01-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-01-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-01-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-01-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-01-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-01-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-01-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-01-2019', 'dd-mm-yyyy'), 1);
commit;

--200 records committed...
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-01-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-01-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('27-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('27-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('27-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('27-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('27-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('27-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('27-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('27-01-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('27-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('27-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('27-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('27-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('27-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('27-01-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('27-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('27-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('27-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('27-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('27-01-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('27-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('27-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('27-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('28-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('28-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('28-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('28-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('28-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('28-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('28-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('28-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('28-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('28-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('28-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('28-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('28-01-2019', 'dd-mm-yyyy'), 22);

--300 records committed...
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('28-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('28-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('28-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('28-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('28-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('28-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('28-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('28-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('28-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('29-01-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('29-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('29-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('29-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('29-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('29-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('29-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('29-01-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('29-01-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('29-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('29-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('29-01-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('29-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('29-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('29-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('29-01-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('29-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('29-01-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('29-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('29-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('29-01-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('29-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('30-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('30-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('30-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('30-01-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('30-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('30-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('30-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('30-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('30-01-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('30-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('30-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('30-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('30-01-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('30-01-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('30-01-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('30-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('30-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('30-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('30-01-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('30-01-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('30-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('30-01-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('31-01-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('31-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('31-01-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('31-01-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('31-01-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('31-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('31-01-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('31-01-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('31-01-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('31-01-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('31-01-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('31-01-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('31-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('31-01-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('31-01-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('31-01-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('31-01-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('31-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('31-01-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('31-01-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('31-01-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('31-01-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-02-2019', 'dd-mm-yyyy'), 8);

--400 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-02-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-02-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-02-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-02-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-02-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-02-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-02-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-02-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-02-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-02-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-02-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-02-2019', 'dd-mm-yyyy'), 22);

--500 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-02-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-02-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-02-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-02-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-02-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-02-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-02-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-02-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-02-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-02-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-02-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-02-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-02-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-02-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-02-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-02-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-02-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-02-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-02-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-02-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-02-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-02-2019', 'dd-mm-yyyy'), 22);

--600 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-02-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-02-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-02-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-02-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-02-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-02-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-02-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-02-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-02-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-02-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-02-2019', 'dd-mm-yyyy'), 10);

--700 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-02-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-02-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-02-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-02-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-02-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-02-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-02-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-02-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-02-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-02-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-02-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-02-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-02-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-02-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-02-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-02-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-02-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-02-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-02-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-02-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-02-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-02-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-02-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-02-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-02-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-02-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-05-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-05-2019', 'dd-mm-yyyy'), 38);

--800 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-05-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-05-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-05-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-05-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-05-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-05-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-05-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-05-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-05-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-05-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-05-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-05-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-05-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-05-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-05-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-05-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-05-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-05-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-05-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-05-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-05-2019', 'dd-mm-yyyy'), 38);

--900 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-05-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-05-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-05-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-05-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-05-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-05-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-05-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-05-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-05-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-05-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-05-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-05-2019', 'dd-mm-yyyy'), 22);

--1000 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-05-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-05-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-05-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-05-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-05-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-05-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-05-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-05-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-05-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-05-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-05-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-05-2019', 'dd-mm-yyyy'), 9);

--1100 records committed...

values (3, to_date('01-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-05-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-05-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-05-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-05-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-05-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-05-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-03-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-03-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-03-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-03-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-03-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-03-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-03-2019', 'dd-mm-yyyy'), 49);

--1200 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-03-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-03-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-03-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-03-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-03-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-03-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-03-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-03-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-03-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-03-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-03-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-03-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-03-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-03-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-03-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-03-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-03-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-03-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-03-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-03-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-03-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-03-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-03-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-03-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-03-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-03-2019', 'dd-mm-yyyy'), 22);

--1300 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-03-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-03-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-03-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-03-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-03-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-03-2019', 'dd-mm-yyyy'), 10);

--1400 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-03-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-03-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-03-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-03-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-03-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-03-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-03-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-03-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-03-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-03-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-03-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-03-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-03-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-03-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-03-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-03-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-03-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-03-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-03-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-03-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-03-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-03-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-03-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-03-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-03-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-03-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-03-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-03-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-03-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-03-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-03-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-03-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-03-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-04-2019', 'dd-mm-yyyy'), 3);

--1500 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('11-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('11-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('11-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('12-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('12-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('12-04-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('12-04-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('12-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('13-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-04-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('13-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('13-04-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('13-04-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('13-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('16-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-04-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('16-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('16-04-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('16-04-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('16-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-04-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('17-04-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('17-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-04-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('17-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-04-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-04-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-04-2019', 'dd-mm-yyyy'), 32);

--1600 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-04-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('17-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('17-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('18-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-04-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-04-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('18-04-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('18-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-04-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-04-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('18-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('18-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('21-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-04-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-04-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('21-04-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('21-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-04-2019', 'dd-mm-yyyy'), 29);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-04-2019', 'dd-mm-yyyy'), 34);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('21-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('21-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-04-2019', 'dd-mm-yyyy'), 7);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('22-04-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('22-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-04-2019', 'dd-mm-yyyy'), 16);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-04-2019', 'dd-mm-yyyy'), 27);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('22-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-04-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-04-2019', 'dd-mm-yyyy'), 32);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-04-2019', 'dd-mm-yyyy'), 11);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('22-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('22-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('23-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('23-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('23-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('23-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('23-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('24-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-04-2019', 'dd-mm-yyyy'), 15);

--1700 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('24-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('24-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('24-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('24-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('25-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('25-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('25-04-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('25-04-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('25-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('05-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-04-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('05-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('05-04-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('05-04-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('05-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('04-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('04-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('04-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('04-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('04-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-04-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('03-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-04-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('03-04-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-04-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('03-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-04-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-04-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('03-04-2019', 'dd-mm-yyyy'), 30);

--1800 records committed...

insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-04-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('03-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('02-04-2019', 'dd-mm-yyyy'), 23);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('02-04-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-04-2019', 'dd-mm-yyyy'), 20);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('02-04-2019', 'dd-mm-yyyy'), 37);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-04-2019', 'dd-mm-yyyy'), 4);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('02-04-2019', 'dd-mm-yyyy'), 38);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-04-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('02-04-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-04-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-04-2019', 'dd-mm-yyyy'), 18);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('01-04-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-04-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-04-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-04-2019', 'dd-mm-yyyy'), 25);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('01-04-2019', 'dd-mm-yyyy'), 36);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-04-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-04-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-04-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('01-04-2019', 'dd-mm-yyyy'), 49);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-04-2019', 'dd-mm-yyyy'), 6);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-04-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-04-2019', 'dd-mm-yyyy'), 13);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('01-04-2019', 'dd-mm-yyyy'), 33);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-04-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-04-2019', 'dd-mm-yyyy'), 21);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('01-04-2019', 'dd-mm-yyyy'), 31);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('10-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-05-2019', 'dd-mm-yyyy'), 12);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-05-2019', 'dd-mm-yyyy'), 15);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-05-2019', 'dd-mm-yyyy'), 26);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('10-05-2019', 'dd-mm-yyyy'), 39);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-05-2019', 'dd-mm-yyyy'), 2);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-05-2019', 'dd-mm-yyyy'), 17);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (3, to_date('10-05-2019', 'dd-mm-yyyy'), 40);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-05-2019', 'dd-mm-yyyy'), 5);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-05-2019', 'dd-mm-yyyy'), 10);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-05-2019', 'dd-mm-yyyy'), 19);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-05-2019', 'dd-mm-yyyy'), 24);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (4, to_date('10-05-2019', 'dd-mm-yyyy'), 30);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-05-2019', 'dd-mm-yyyy'), 9);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-05-2019', 'dd-mm-yyyy'), 28);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (17, to_date('10-05-2019', 'dd-mm-yyyy'), 3);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-05-2019', 'dd-mm-yyyy'), 1);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-05-2019', 'dd-mm-yyyy'), 8);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-05-2019', 'dd-mm-yyyy'), 14);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (1, to_date('11-05-2019', 'dd-mm-yyyy'), 22);
insert into PERSONCANTEENORDER (personid, dateorder, dishid)
values (2, to_date('11-05-2019', 'dd-mm-yyyy'), 3);

--1875 records committed...

--PERSONCARS...
insert into PERSONCARS (personid, carregnumber, carname)
values (1, 'р077ом 178 RUS', 'Ауди A4');
insert into PERSONCARS (personid, carregnumber, carname)
values (2, 'к999ар 79 RUS', 'Рено Логан');
insert into PERSONCARS (personid, carregnumber, carname)
values (3, 'в575аа 69 RUS', 'Тойота Камри');
insert into PERSONCARS (personid, carregnumber, carname)
values (4, 'к999ар 79 RUS', 'Ауди 100');
insert into PERSONCARS (personid, carregnumber, carname)
values (5, 'к575ва 77 RUS', 'Тойота Рав 4');
insert into PERSONCARS (personid, carregnumber, carname)
values (7, 'у999ар 179 RUS', 'Лексус RX300');
insert into PERSONCARS (personid, carregnumber, carname)
values (8, 'н575ха 177 RUS', 'Ниссан Альмера');
insert into PERSONCARS (personid, carregnumber, carname)
values (9, 'о898ем 79 RUS', 'Ниссан Пэтрол');
insert into PERSONCARS (personid, carregnumber, carname)
values (10, 'с555сс 69 RUS', 'БМВ 320 E46');
insert into PERSONCARS (personid, carregnumber, carname)
values (12, 'а001ар 79 RUS', 'Фольксваген Гольф 4');
insert into PERSONCARS (personid, carregnumber, carname)
values (14, 'в700аа 179 RUS', 'Фольксваген Пассат B5');
insert into PERSONCARS (personid, carregnumber, carname)
values (16, 'н111ар 79 RUS', 'Хаммер 2');
insert into PERSONCARS (personid, carregnumber, carname)
values (16, 'в575вв 79 RUS', 'Мерседес AMG');
insert into PERSONCARS (personid, carregnumber, carname)
values (11, 'в999ар 79 RUS', 'Жигули ВАЗ 2110');
insert into PERSONCARS (personid, carregnumber, carname)
values (19, 'х505ор 79 RUS', 'Мицубиши Кольт');
insert into PERSONCARS (personid, carregnumber, carname)
values (5, 'п878ро 77 RUS', 'Мазда RX-8');


insert into PERSONPAYMENTS (personid, sum, period)
values (1, 55000.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (2, 80000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (3, 70000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (4, 45800.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (5, 57000.1, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (6, 75000.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (7, 90000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (8, 50000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (9, 70000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (10, 45800.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (11, 57000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (12, 75000.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (13, 90000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (14, 45800.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (15, 57000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (16, 75000.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (17, 90000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (1, 55000.7, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (2, 81000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (3, 70000.2, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (4, 45800.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (5, 57000.1, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (6, 75000.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (7, 90000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (8, 50000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (9, 70000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (10, 45800.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (11, 57000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (12, 75000.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (13, 86000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (14, 45800.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (15, 57000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (16, 75000.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (17, 90000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (1, 55000.7, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (2, 81000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (3, 70000.2, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (4, 45800.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (5, 57000.1, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (6, 75000.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (7, 90000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (8, 50000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (9, 70000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (10, 45800.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (11, 57000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (12, 75000.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (13, 86000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (14, 45800.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (15, 57000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (16, 75000.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (17, 90000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (1, 55000.7, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (2, 81000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (3, 70000.2, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (4, 45800.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (5, 57000.1, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (6, 75000.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (7, 90000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (8, 50000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (9, 70000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (10, 45800.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (11, 57000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (12, 75000.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (13, 86000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (14, 45800.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (15, 57000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (16, 75000.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (17, 90000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (1, 55000.7, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (2, 81000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (3, 70000.2, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (4, 45800.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (5, 57000.1, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (6, 75000.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (7, 90000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (8, 50000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (9, 70000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (10, 45800.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (11, 57000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (12, 75000.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (13, 86000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (14, 45800.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (15, 57000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (16, 75000.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (17, 90000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (18, 55000.7, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (19, 81000, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (20, 70000.2, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (21, 45800.5, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (18, 57000.1, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (19, 75000.5, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (20, 90000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (21, 50000, to_date('01-02-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (18, 70000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (19, 45800.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (20, 57000, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (21, 75000.5, to_date('01-03-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (18, 86000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (19, 45800.5, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (20, 57000, to_date('01-04-2019', 'dd-mm-yyyy'));

--prompt 100 records committed...

insert into PERSONPAYMENTS (personid, sum, period)
values (21, 57000, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (18, 86000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (19, 45800.5, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (20, 57000, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PERSONPAYMENTS (personid, sum, period)
values (21, 57000, to_date('01-05-2019', 'dd-mm-yyyy'));

--prompt 105 records loaded

insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (1, 'Иванов Иван Иванович', to_date('12-04-1981', 'dd-mm-yyyy'), 1, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (2, 'Петров Павел Сергеевич', to_date('16-09-1982', 'dd-mm-yyyy'), 3, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (3, 'Караваева Людмила Сергеевна', to_date('19-09-1982', 'dd-mm-yyyy'), 2, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (4, 'Черных Александр Александрович', to_date('22-01-1972', 'dd-mm-yyyy'), 2, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (5, 'Лимонадова Анна Васильевна', to_date('12-02-1977', 'dd-mm-yyyy'), 3, 2);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (6, 'Белый Олег Викторович', to_date('30-03-1986', 'dd-mm-yyyy'), 1, 2);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (7, 'Финина Алла Павловна', to_date('01-03-1984', 'dd-mm-yyyy'), 1, 2);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (8, 'Некрасов Дмитрий Валерьевич', to_date('06-03-1982', 'dd-mm-yyyy'), 2, 2);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (9, 'Гостин Сергей Олегович', to_date('12-04-1982', 'dd-mm-yyyy'), 3, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (10, 'Розовая Лидия Георгиевна', to_date('14-05-1982', 'dd-mm-yyyy'), 1, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (11, 'Бодров Иван Антонович', to_date('17-06-1988', 'dd-mm-yyyy'), 2, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (12, 'Симонова Ольга Петровна', to_date('07-07-1979', 'dd-mm-yyyy'), 3, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (13, 'Красавина Лидия Борисовна', to_date('05-08-1978', 'dd-mm-yyyy'), 4, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (14, 'Первый Иван Иванович', to_date('08-09-1977', 'dd-mm-yyyy'), 1, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (15, 'Сидоров Иван Денисович', to_date('29-10-1979', 'dd-mm-yyyy'), 2, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (16, 'Шилова Анна Ивановна', to_date('19-11-1980', 'dd-mm-yyyy'), 2, 3);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (17, 'Иванова Тамара Николаевна', to_date('15-05-1977', 'dd-mm-yyyy'), 4, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (18, 'Сливкина Наталья Эдуардовна', to_date('08-09-1977', 'dd-mm-yyyy'), 5, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (19, 'Ломоносов Игорь Павлович', to_date('09-09-1980', 'dd-mm-yyyy'), 5, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (20, 'Линина Мария Семеновна', to_date('19-10-1981', 'dd-mm-yyyy'), 5, 1);
insert into PERSONS (personid, name, birthdate, departamentid, filialid)
values (21, 'Бабкина Надежда Григорьевна', to_date('03-12-1982', 'dd-mm-yyyy'), 5, 1);

--prompt 21 records loaded

insert into PERSONSEXTERNAL (id, fio, departamentid, contact_mobile_phone)
values (100, 'Ковчег Александр Васильевич', 1, '8(906)221-21-39');
insert into PERSONSEXTERNAL (id, fio, departamentid, contact_mobile_phone)
values (105, 'Куприянова Ольга Ивановна', 2, '8(908)334-28-90');
insert into PERSONSEXTERNAL (id, fio, departamentid, contact_mobile_phone)
values (108, 'Нибоков Павел Давыдович', 2, '8(905)772-44-81');
insert into PERSONSEXTERNAL (id, fio, departamentid, contact_mobile_phone)
values (109, 'Миролюбова Зара Вячеславовна', 2, null);

--prompt 4 records loaded

insert into PHONES (phoneid, personid, phone_type, phone_number)
values (1, 1, 'мобильный', '8(911)8818182');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (2, 1, 'рабочий', '495 244 22 11');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (3, 2, 'мобильный', '8(906)773-0909');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (4, 3, 'мобильный', '8(903)443-34-87');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (5, 4, 'мобильный', '8(902)0801122');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (6, 5, 'рабочий', '495 225 16 83');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (7, 6, 'мобильный', '8(963)220-12-54');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (8, 7, 'мобильный', '8(902)011-34-00');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (9, 8, 'мобильный', '8(903)-181-22-41');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (10, 9, 'мобильный', '8(946)221-02-02');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (11, 9, 'рабочий', '495 225-23-21, доб.10');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (12, 12, 'рабочий', '495 225-23-21, доб.11');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (13, 12, 'мобильный', '8(963)116-12-12');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (14, 13, 'рабочий', '499 225-23-22');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (15, 19, 'мобильный', '8(901)120-12-19');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (16, 20, 'мобильный', '7(904)0981010');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (17, 20, 'рабочий', '499 225-23-26');
insert into PHONES (phoneid, personid, phone_type, phone_number)
values (18, 20, 'рабочий', '499 225-23-27');

