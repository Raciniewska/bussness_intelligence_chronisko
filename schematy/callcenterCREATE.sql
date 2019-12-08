use CallCenter
go


create table agent(
ID_agenta integer not null identity (1,1) primary key,
imie varchar(40),
nazwisko varchar(80),
PESEL bigint check (PESEL < 99999999999 AND PESEL > 00000000000),
data_zatrudnienia date,
data_zakonczenia date,

)

create table klient(
ID_klienta integer not null identity(1,1) primary key,
imie varchar(40),
nazwisko varchar(80),
miasto varchar(60),
adres_wysylki varchar(80),
numer_telefonu numeric,
data_urodzenia date,
email varchar(40),
)

create table firma_kurierska(
ID_firmy_kurierskiej integer not null identity(1,1) primary key,
nazwa varchar(60),
)

create table fabryka(
ID_fabryki integer not null identity(1,1) primary key,
nazwa varchar(60),
adres varchar(120),
)

create table magazyn(
ID_magazynu integer not null identity(1,1) primary key,
nazwa varchar(60),
tel_kontaktowy numeric,
adres varchar(120),
)

create table produkt(
ID_produktu integer not null identity(1,1) primary key,
nazwa varchar(200),
cena numeric(8,2) check (cena>0),
producent varchar(80),
data_produkcji date,
FK_fabryka INTEGER FOREIGN KEY REFERENCES fabryka(ID_fabryki),
FK_magazyn INTEGER FOREIGN KEY REFERENCES magazyn(ID_magazynu),
opis varchar(200),
)

create table zamowienie(
ID_zamowienia integer not null identity(1,1) primary key,
FK_klient INTEGER FOREIGN KEY REFERENCES klient(ID_klienta),
FK_agent INTEGER FOREIGN KEY REFERENCES agent(ID_agenta),
FK_firma_kurierska INTEGER FOREIGN KEY REFERENCES firma_kurierska(ID_firmy_kurierskiej),
data_zamowienia datetime,
platnosc varchar(80),
)

create table sprawa(
ID_sprawy integer not null identity(1,1) primary key,
data_otwarcia date,
data_zamkniecia date,
FK_klient INTEGER FOREIGN KEY REFERENCES klient(ID_klienta),
FK_agent INTEGER FOREIGN KEY REFERENCES agent(id_agenta),
FK_zamowienie INTEGER FOREIGN KEY REFERENCES zamowienie(ID_zamowienia),
FK_produkt INTEGER FOREIGN KEY REFERENCES produkt(ID_produktu),
typ_sprawy varchar(80),
)

create table rozmowa(
ID_rozmowy integer not null identity(1,1) primary key,
czas_oczekiwania numeric,
FK_klient INTEGER FOREIGN KEY REFERENCES klient(ID_klienta),
FK_agent INTEGER FOREIGN KEY REFERENCES agent(ID_agenta),
FK_sprawa INTEGER FOREIGN KEY REFERENCES sprawa(ID_sprawy),
czas_rozpoczecia datetime,
czas_zakonczenia datetime,
)

create table produkty_w_zamowieniu(
ID_produktu integer,
ID_zamowienia integer,
ilosc integer,
cena numeric (8,2),
PRIMARY KEY (ID_zamowienia, ID_produktu),
FOREIGN KEY(ID_zamowienia) REFERENCES zamowienie(ID_zamowienia),
FOREIGN KEY(ID_produktu) REFERENCES produkt(ID_produktu),

