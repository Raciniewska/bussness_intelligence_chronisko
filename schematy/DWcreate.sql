/*create database DW
use DW
go*/

create table czas(
ID_Czasu numeric not null identity (1,1) primary key,
Godzina numeric not null check(Godzina < 24 and Godzina >=0),
Minuta numeric not null check(Minuta >= 0 and Minuta < 60),
Pora_Dnia varchar(20) not null check(Pora_Dnia IN('od 0 do 8','od 9 do 12', 'od 13 do 15',
												  'od 16 do 20', 'od 20 do 23'))
);

create table miesi�c(
ID_Miesi�ca numeric not null identity (1,1) primary key,
Nazwa varchar(20) not null check(Nazwa in('stycze�', 'luty', 'marzec', 'kwiecie�', 'maj', 'czerwiec', 
								'lipiec', 'sierpie�', 'wrzesie�', 'pa�dziernik', 'listopad', 'grudzie�')),
Rok numeric(4,0) not null,
Ilo��_Dni_�wi�tecznych varchar(20) not null check(Ilo��_Dni_�wi�tecznych in('brak', 'ma�o', '�rednio', 'du�o')),
Ilo��_Nowych_Agent�w varchar(20) not null check(Ilo��_Nowych_Agent�w in ('od 0 do 2', 'od 3 do 6', 'od 7 do 12', 'od 13 do 20', 'od 21 do 40', 'ponad 40'))
);

create table czas_trwania_rozmowy(
ID_Czasu_Trwania_Rozmowy numeric not null identity (1,1) primary key,
Przedzia�_Czasowy varchar(20) not null check(Przedzia�_Czasowy in('od 0 do 10', 'od 11 do 30', 'od 31 do 120', 
											'od 121 do 240','od 241 do 480','od 480 do 600', 'ponad 601'))
);


create table data(
ID_Daty numeric not null identity (1,1) primary key,
Data date,
ID_Miesi�ca numeric foreign key references miesi�c(ID_Miesi�ca),
Dzie�_Tygodnia varchar(20) not null check(Dzie�_Tygodnia in('poniedzia�ek','wtorek', '�roda', 'czwartek', 'pi�tek', 'sobota', 'niedziela')),
Dzie�_Pracuj�cy varchar(20) not null check(Dzie�_Pracuj�cy in('wolny','roboczy')),
Czas_Wakacyjny varchar(50) not null check(Czas_Wakacyjny in('poza wakacjami', 'wakacje zimowe', 'wakacje letnie')),
�wi�to varchar(100) check(�wi�to in('Nowy Rok', 'Trzech Kr�li', 'Walentynki', 'Dzie� Babci', 'Dzie� Dziadka',
 'Dzie� Kobiet', 'Wielkanoc', 'Poniedzia�ek Wielkanocny', '�wi�to Pracy', '�wi�to Narodowe Trzeciego Maja',
  'Dzie� Matki', 'Dzie� Dziecka', 'Dzie� Ojca', 'Dzie� Ch�opaka', 'Wszystkich �wi�tych', 'Narodowe �wi�to Niepodleg�o�ci'
  , 'Bo�e Narodzenie', 'drugi dzie� Bo�ego Narodzenia')),
Dzie�_Przed�wi�teczny varchar(100) check(Dzie�_Przed�wi�teczny in('jutro Nowy Rok', 'jutro Trzech Kr�li',
 'jutro Walentynki', 'jutro Dzie� Babci', 'jutro Dzie� Dziadka',
 'jutro Dzie� Kobiet', 'jutro Wielkanoc', 'jutro Poniedzia�ek Wielkanocny',
 'jutro �wi�to Pracy', 'jutro �wi�to Narodowe Trzeciego Maja', 'jutro Dzie� Matki',
 'jutro Dzie� Dziecka', 'jutro Dzie� Ojca', 'jutro Dzie� Ch�opaka',
 'jutro Wszystkich �wi�tych', 'jutro Narodowe �wi�to Niepodleg�o�ci',
 'jutro Bo�e Narodzenie', 'jutro drugi dzie� Bo�ego Narodzenia'))
);

create table sprawa(
ID_Sprawy numeric not null identity (1,1) primary key,
ID_Daty_Otwarcia numeric foreign key references data(ID_Daty),
ID_Daty_Zamkni�cia numeric foreign key references data(ID_Daty),
Czas_Rozwi�zania varchar(30) not null check(Czas_Rozwi�zania in('bardzo szybko', 'szybko', 'przeci�tnie', 'd�ugo', 'bardzo d�ugo', 'nierozwi�zana')),
Typ_Sprawy varchar(30) not null check(Typ_Sprawy in('reklamacja', 'brak zwrotu za zam�wienie', 'zagubiona paczka', 'zwrot', 'informacja'))
);

create table agent(
ID_Agenta numeric not null identity (1,1) primary key,
ID_Daty_Zatrudnienia numeric foreign key references data(ID_Daty),
Imi�_Nazwisko varchar(120) not null,
PESEL numeric(11,0),
Przedzia�_Wiekowy varchar(20) not null check(Przedzia�_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Sta� varchar(20) not null check(Sta� in('do roku', 'do 5 lat', 'ponad 5 lat')),
Team varchar(10) not null,
Aktualno�� varchar(20) not null check (Aktualno�� in('aktualne','nieaktualne'))
);

create table klient(
ID_Klienta numeric not null identity (1,1) primary key,
Imi�_Nazwisko varchar(120) not null,
ID_Daty_Urodzenia numeric foreign key references data(ID_Daty),
Przedzia�_Wiekowy varchar(20) not null check(Przedzia�_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Ulica varchar(80),
Numer_Domu varchar(10),
Miasto varchar(80),
Status varchar(30) not null check(Status in('nowy', 'okazjonalny', 'cz�sty', 'sta�y')),
ID_Daty_Do��czenia numeric foreign key references data(ID_Daty),
Aktualno�� varchar(20) not null check (Aktualno�� in('aktualny','nieaktualny'))
);

create table rozmowa(
ID_Daty_Rozmowy numeric not null foreign key references data(ID_Daty),
ID_Godziny_Rozpocz�cia numeric not null foreign key references czas(ID_Czasu),
ID_Godziny_Zako�czenia numeric not null foreign key references czas(ID_Czasu),
ID_Agenta numeric not null foreign key references agent(ID_Agenta),
ID_Klienta numeric not null foreign key references klient(ID_Klienta),
ID_Sprawy numeric not null foreign key references sprawa(ID_Sprawy),
ID_Czasu_Trwania_Rozmowy numeric not null foreign key references czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy),
Czas_Oczekiwania numeric not null check(Czas_Oczekiwania > 0),
Ocena_Og�lna_Manad�era numeric check(Ocena_Og�lna_Manad�era < 101 and Ocena_Og�lna_Manad�era >0),
Ocena_Zadowolenia_Klienta numeric check(Ocena_Zadowolenia_Klienta < 11 and Ocena_Zadowolenia_Klienta >0)
PRIMARY KEY(ID_Daty_Rozmowy,ID_Godziny_Rozpocz�cia,ID_Godziny_Zako�czenia,
			ID_Agenta,ID_Klienta,ID_Sprawy,ID_Czasu_Trwania_Rozmowy)
);


