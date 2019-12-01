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

create table miesi¹c(
ID_Miesi¹ca numeric not null identity (1,1) primary key,
Nazwa varchar(20) not null check(Nazwa in('styczeñ', 'luty', 'marzec', 'kwiecieñ', 'maj', 'czerwiec', 
								'lipiec', 'sierpieñ', 'wrzesieñ', 'paŸdziernik', 'listopad', 'grudzieñ')),
Rok numeric(4,0) not null,
Iloœæ_Dni_Œwi¹tecznych varchar(20) not null check(Iloœæ_Dni_Œwi¹tecznych in('brak', 'ma³o', 'œrednio', 'du¿o')),
Iloœæ_Nowych_Agentów varchar(20) not null check(Iloœæ_Nowych_Agentów in ('od 0 do 2', 'od 3 do 6', 'od 7 do 12', 'od 13 do 20', 'od 21 do 40', 'ponad 40'))
);

create table czas_trwania_rozmowy(
ID_Czasu_Trwania_Rozmowy numeric not null identity (1,1) primary key,
Przedzia³_Czasowy varchar(20) not null check(Przedzia³_Czasowy in('od 0 do 10', 'od 11 do 30', 'od 31 do 120', 
											'od 121 do 240','od 241 do 480','od 480 do 600', 'ponad 601'))
);


create table data(
ID_Daty numeric not null identity (1,1) primary key,
Data date,
ID_Miesi¹ca numeric foreign key references miesi¹c(ID_Miesi¹ca),
Dzieñ_Tygodnia varchar(20) not null check(Dzieñ_Tygodnia in('poniedzia³ek','wtorek', 'œroda', 'czwartek', 'pi¹tek', 'sobota', 'niedziela')),
Dzieñ_Pracuj¹cy varchar(20) not null check(Dzieñ_Pracuj¹cy in('wolny','roboczy')),
Czas_Wakacyjny varchar(50) not null check(Czas_Wakacyjny in('poza wakacjami', 'wakacje zimowe', 'wakacje letnie')),
Œwiêto varchar(100) check(Œwiêto in('Nowy Rok', 'Trzech Króli', 'Walentynki', 'Dzieñ Babci', 'Dzieñ Dziadka',
 'Dzieñ Kobiet', 'Wielkanoc', 'Poniedzia³ek Wielkanocny', 'Œwiêto Pracy', 'Œwiêto Narodowe Trzeciego Maja',
  'Dzieñ Matki', 'Dzieñ Dziecka', 'Dzieñ Ojca', 'Dzieñ Ch³opaka', 'Wszystkich Œwiêtych', 'Narodowe Œwiêto Niepodleg³oœci'
  , 'Bo¿e Narodzenie', 'drugi dzieñ Bo¿ego Narodzenia')),
Dzieñ_Przedœwi¹teczny varchar(100) check(Dzieñ_Przedœwi¹teczny in('jutro Nowy Rok', 'jutro Trzech Króli',
 'jutro Walentynki', 'jutro Dzieñ Babci', 'jutro Dzieñ Dziadka',
 'jutro Dzieñ Kobiet', 'jutro Wielkanoc', 'jutro Poniedzia³ek Wielkanocny',
 'jutro Œwiêto Pracy', 'jutro Œwiêto Narodowe Trzeciego Maja', 'jutro Dzieñ Matki',
 'jutro Dzieñ Dziecka', 'jutro Dzieñ Ojca', 'jutro Dzieñ Ch³opaka',
 'jutro Wszystkich Œwiêtych', 'jutro Narodowe Œwiêto Niepodleg³oœci',
 'jutro Bo¿e Narodzenie', 'jutro drugi dzieñ Bo¿ego Narodzenia'))
);

create table sprawa(
ID_Sprawy numeric not null identity (1,1) primary key,
ID_Daty_Otwarcia numeric foreign key references data(ID_Daty),
ID_Daty_Zamkniêcia numeric foreign key references data(ID_Daty),
Czas_Rozwi¹zania varchar(30) not null check(Czas_Rozwi¹zania in('bardzo szybko', 'szybko', 'przeciêtnie', 'd³ugo', 'bardzo d³ugo', 'nierozwi¹zana')),
Typ_Sprawy varchar(30) not null check(Typ_Sprawy in('reklamacja', 'brak zwrotu za zamówienie', 'zagubiona paczka', 'zwrot', 'informacja'))
);

create table agent(
ID_Agenta numeric not null identity (1,1) primary key,
ID_Daty_Zatrudnienia numeric foreign key references data(ID_Daty),
Imiê_Nazwisko varchar(120) not null,
PESEL numeric(11,0),
Przedzia³_Wiekowy varchar(20) not null check(Przedzia³_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Sta¿ varchar(20) not null check(Sta¿ in('do roku', 'do 5 lat', 'ponad 5 lat')),
Team varchar(10) not null,
Aktualnoœæ varchar(20) not null check (Aktualnoœæ in('aktualne','nieaktualne'))
);

create table klient(
ID_Klienta numeric not null identity (1,1) primary key,
Imiê_Nazwisko varchar(120) not null,
ID_Daty_Urodzenia numeric foreign key references data(ID_Daty),
Przedzia³_Wiekowy varchar(20) not null check(Przedzia³_Wiekowy in('do 18 lat', 'od 19 do 25 lat',
'od 26 do 35 lat', 'od 36 do 45 lat', 'od 46 do 60 lat', 'ponad 60 lat')),
Ulica varchar(80),
Numer_Domu varchar(10),
Miasto varchar(80),
Status varchar(30) not null check(Status in('nowy', 'okazjonalny', 'czêsty', 'sta³y')),
ID_Daty_Do³¹czenia numeric foreign key references data(ID_Daty),
Aktualnoœæ varchar(20) not null check (Aktualnoœæ in('aktualny','nieaktualny'))
);

create table rozmowa(
ID_Daty_Rozmowy numeric not null foreign key references data(ID_Daty),
ID_Godziny_Rozpoczêcia numeric not null foreign key references czas(ID_Czasu),
ID_Godziny_Zakoñczenia numeric not null foreign key references czas(ID_Czasu),
ID_Agenta numeric not null foreign key references agent(ID_Agenta),
ID_Klienta numeric not null foreign key references klient(ID_Klienta),
ID_Sprawy numeric not null foreign key references sprawa(ID_Sprawy),
ID_Czasu_Trwania_Rozmowy numeric not null foreign key references czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy),
Czas_Oczekiwania numeric not null check(Czas_Oczekiwania > 0),
Ocena_Ogólna_Manad¿era numeric check(Ocena_Ogólna_Manad¿era < 101 and Ocena_Ogólna_Manad¿era >0),
Ocena_Zadowolenia_Klienta numeric check(Ocena_Zadowolenia_Klienta < 11 and Ocena_Zadowolenia_Klienta >0)
PRIMARY KEY(ID_Daty_Rozmowy,ID_Godziny_Rozpoczêcia,ID_Godziny_Zakoñczenia,
			ID_Agenta,ID_Klienta,ID_Sprawy,ID_Czasu_Trwania_Rozmowy)
);


