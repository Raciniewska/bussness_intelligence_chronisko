/*create database DW
use DW
go*/

create table czas(
ID_Czasu numeric not null identity (1,1) primary key,
Godzina numeric not null check(Godzina < 24 and Godzina >=0),
Minuta numeric not null check(Minuta >= 0 and Minuta < 60),
Pora_Dnia varchar(20) not null check(Pora_Dnia IN('od 0 do 8','od 9 do 12', 'od 13 do 15',
												  'od 16 do 20', 'od 21 do 23'))
);

create table miesiąc(
ID_Miesiąca numeric not null identity (1,1) primary key,
Nazwa varchar(20) not null check(Nazwa in('styczeń', 'luty', 'marzec', 'kwiecień', 'maj', 'czerwiec', 
								'lipiec', 'sierpień', 'wrzesień', 'październik', 'listopad', 'grudzień')),
Rok numeric(4,0) not null,
Ilość_Dni_Świątecznych varchar(20) not null check(Ilość_Dni_Świątecznych in('brak', 'mało', 'średnio', 'dużo')),
Ilość_Nowych_Agentów varchar(20) not null check(Ilość_Nowych_Agentów in ('od 0 do 2', 'od 3 do 6', 'od 7 do 12', 'od 13 do 20', 'od 21 do 40', 'ponad 40'))
);

create table czas_trwania_rozmowy(
ID_Czasu_Trwania_Rozmowy numeric not null identity (1,1) primary key,
Przedział_Czasowy varchar(20) not null check(Przedział_Czasowy in('od 0 do 10', 'od 11 do 30', 'od 31 do 120', 
											'od 121 do 240','od 241 do 480','od 480 do 600', 'ponad 601'))
);


create table data(
ID_Daty numeric not null identity (1,1) primary key,
Data date,
ID_Miesiąca numeric foreign key references miesiąc(ID_Miesiąca),
Dzień_Tygodnia varchar(20) not null check(Dzień_Tygodnia in('poniedziałek','wtorek', 'środa', 'czwartek', 'piątek', 'sobota', 'niedziela')),
Dzień_Pracujący varchar(20) not null check(Dzień_Pracujący in('wolny','roboczy')),
Czas_Wakacyjny varchar(50) not null check(Czas_Wakacyjny in('poza wakacjami', 'wakacje zimowe', 'wakacje letnie')),
Święto varchar(100) check(Święto in('Nowy Rok', 'Trzech Króli', 'Walentynki', 'Dzień Babci', 'Dzień Dziadka',
 'Dzień Kobiet', 'Wielkanoc', 'Poniedziałek Wielkanocny', 'Święto Pracy', 'Święto Narodowe Trzeciego Maja',
  'Dzień Matki', 'Dzień Dziecka', 'Dzień Ojca', 'Dzień Chłopaka', 'Wszystkich Świętych', 'Narodowe Święto Niepodległości'
  , 'Boże Narodzenie', 'drugi dzień Bożego Narodzenia')),
Dzień_Przedświąteczny varchar(100) check(Dzień_Przedświąteczny in('jutro Nowy Rok', 'jutro Trzech Króli',
 'jutro Walentynki', 'jutro Dzień Babci', 'jutro Dzień Dziadka',
 'jutro Dzień Kobiet', 'jutro Wielkanoc', 'jutro Poniedziałek Wielkanocny',
 'jutro Święto Pracy', 'jutro Święto Narodowe Trzeciego Maja', 'jutro Dzień Matki',
 'jutro Dzień Dziecka', 'jutro Dzień Ojca', 'jutro Dzień Chłopaka',
 'jutro Wszystkich Świętych', 'jutro Narodowe Święto Niepodległości',
 'jutro Boże Narodzenie', 'jutro drugi dzień Bożego Narodzenia'))
);

create table sprawa(
ID_Sprawy numeric not null identity (1,1) primary key,
ID_Daty_Otwarcia numeric foreign key references data(ID_Daty),
ID_Daty_Zamknięcia numeric foreign key references data(ID_Daty),
Czas_Rozwiązania varchar(30) not null check(Czas_Rozwiązania in('bardzo szybko', 'szybko', 'przeciętnie', 'długo', 'bardzo długo', 'nierozwiązana')),
Typ_Sprawy varchar(30) not null check(Typ_Sprawy in('reklamacja', 'brak zwrotu za zamówienie', 'zagubiona paczka', 'zwrot', 'informacja'))
);

create table agent(
ID_Agenta numeric not null identity (1,1) primary key,
ID_Daty_Zatrudnienia numeric foreign key references data(ID_Daty),
Imię_Nazwisko varchar(120) not null,
PESEL numeric(11,0),
Przedział_Wiekowy varchar(20) not null check(Przedział_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Staż varchar(20) not null check(Staż in('do roku', 'do 5 lat', 'ponad 5 lat')),
Team varchar(10) not null,
Aktualność varchar(20) not null check (Aktualność in('aktualne','nieaktualne'))
);

create table klient(
ID_Klienta numeric not null identity (1,1) primary key,
Imię_Nazwisko varchar(120) not null,
ID_Daty_Urodzenia numeric foreign key references data(ID_Daty),
Przedział_Wiekowy varchar(20) not null check(Przedział_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Ulica varchar(80),
Numer_Domu varchar(10),
Miasto varchar(80),
Status varchar(30) not null check(Status in('nowy', 'okazjonalny', 'częsty', 'stały')),
ID_Daty_Dołączenia numeric foreign key references data(ID_Daty),
Aktualność varchar(20) not null check (Aktualność in('aktualny','nieaktualny'))
);

create table rozmowa(
ID_Daty_Rozmowy numeric not null foreign key references data(ID_Daty),
ID_Godziny_Rozpoczęcia numeric not null foreign key references czas(ID_Czasu),
ID_Godziny_Zakończenia numeric not null foreign key references czas(ID_Czasu),
ID_Agenta numeric not null foreign key references agent(ID_Agenta),
ID_Klienta numeric not null foreign key references klient(ID_Klienta),
ID_Sprawy numeric not null foreign key references sprawa(ID_Sprawy),
ID_Czasu_Trwania_Rozmowy numeric not null foreign key references czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy),
Czas_Oczekiwania numeric not null check(Czas_Oczekiwania > 0),
Ocena_Ogólna_Manadżera numeric check(Ocena_Ogólna_Manadżera < 101 and Ocena_Ogólna_Manadżera >0),
Ocena_Zadowolenia_Klienta numeric check(Ocena_Zadowolenia_Klienta < 11 and Ocena_Zadowolenia_Klienta >0)
PRIMARY KEY(ID_Daty_Rozmowy,ID_Godziny_Rozpoczęcia,ID_Godziny_Zakończenia,
			ID_Agenta,ID_Klienta,ID_Sprawy,ID_Czasu_Trwania_Rozmowy)
);


