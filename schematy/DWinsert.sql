  SET IDENTITY_INSERT DW.dbo.czas ON


  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(1,23,23,'od 20 do 23')
  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(2,20,43,'od 16 do 20')
  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(3,8,23,'od 0 do 8')

  SET IDENTITY_INSERT DW.dbo.czas OFF

   SET IDENTITY_INSERT DW.dbo.miesi�c ON

  insert into miesi�c(ID_Miesi�ca, Nazwa, Rok, Ilo��_Dni_�wi�tecznych, Ilo��_Nowych_Agent�w) values(1,'stycze�',2013,'ma�o','od 3 do 6')
  insert into miesi�c(ID_Miesi�ca, Nazwa, Rok, Ilo��_Dni_�wi�tecznych, Ilo��_Nowych_Agent�w) values(2,'luty',2013,'brak','od 0 do 2')
  insert into miesi�c(ID_Miesi�ca, Nazwa, Rok, Ilo��_Dni_�wi�tecznych, Ilo��_Nowych_Agent�w) values(3,'marzec',1943,'ma�o','od 0 do 2')
   SET IDENTITY_INSERT DW.dbo.miesi�c OFF

    SET IDENTITY_INSERT DW.dbo.czas_trwania_rozmowy ON
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia�_Czasowy) values(1,'od 0 do 10')
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia�_Czasowy) values(2,'od 11 do 30')
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia�_Czasowy) values(3,'od 31 do 120')
      SET IDENTITY_INSERT DW.dbo.czas_trwania_rozmowy OFF

	      SET IDENTITY_INSERT DW.dbo.data ON

  insert into data(ID_Daty, Data, ID_Miesi�ca, Dzie�_Tygodnia, Dzie�_Pracuj�cy, Czas_Wakacyjny, �wi�to, Dzie�_Przed�wi�teczny)
  values(1,'2013-01-06',1,'poniedzia�ek','wolny','poza wakacjami','Trzech Kr�li', null)
  insert into data(ID_Daty, Data, ID_Miesi�ca, Dzie�_Tygodnia, Dzie�_Pracuj�cy, Czas_Wakacyjny, �wi�to, Dzie�_Przed�wi�teczny)
  values(2,'2013-01-07',1,'wtorek','roboczy','poza wakacjami',null, null)
  insert into data(ID_Daty, Data, ID_Miesi�ca, Dzie�_Tygodnia, Dzie�_Pracuj�cy, Czas_Wakacyjny, �wi�to, Dzie�_Przed�wi�teczny)
  values(3,'1943-03-07',3,'sobota','roboczy','poza wakacjami',null, null)
      SET IDENTITY_INSERT DW.dbo.data OFF

    SET IDENTITY_INSERT DW.dbo.sprawa ON

  insert into sprawa(ID_Sprawy, ID_Daty_Otwarcia, ID_Daty_Zamkni�cia, Czas_Rozwi�zania, Typ_Sprawy) 
  values(1,1,2,'bardzo szybko','zwrot')
  insert into sprawa(ID_Sprawy, ID_Daty_Otwarcia, ID_Daty_Zamkni�cia, Czas_Rozwi�zania, Typ_Sprawy) 
  values(2,1,1,'bardzo szybko','informacja')
      SET IDENTITY_INSERT DW.dbo.sprawa OFF

	      SET IDENTITY_INSERT DW.dbo.agent ON

  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imi�_Nazwisko, PESEL, Przedzia�_Wiekowy, Sta�, Team, Aktualno��)
  values(1,1,'Adam Nowak', 98072652931, 'od 19 do 25 lat', 'do roku', '1','aktualne')
  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imi�_Nazwisko, PESEL, Przedzia�_Wiekowy, Sta�, Team, Aktualno��)
  values(2,1,'Janina Nowicka', 95012109873, 'od 19 do 25 lat', 'do roku', '1', 'aktualne')
  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imi�_Nazwisko, PESEL, Przedzia�_Wiekowy, Sta�, Team, Aktualno��)
  values(3,2,'Jan Bober', 85012109873, 'od 26 do 35 lat', 'do 5 lat', '1', 'nieaktualne')
     SET IDENTITY_INSERT DW.dbo.agent OFF

	    SET IDENTITY_INSERT DW.dbo.klient ON
  insert into klient(ID_Klienta,Imi�_Nazwisko, ID_Daty_Urodzenia, Przedzia�_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do��czenia,Aktualno��)
  values(1,'Edmund Jagiello�ski', 3, 'ponad 60 lat', 'Grunwaldzka', '204a/5', 'Gda�sk', 'sta�y', 1, 'aktualny')
  insert into klient(ID_Klienta,Imi�_Nazwisko, ID_Daty_Urodzenia, Przedzia�_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do��czenia,Aktualno��)
  values(2,'Danuta Ochocka', 3, 'ponad 60 lat', 'Ruska', '20a', 'Wroc�aw', 'nowy', 1, 'aktualny')
  insert into klient(ID_Klienta,Imi�_Nazwisko, ID_Daty_Urodzenia, Przedzia�_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do��czenia,Aktualno��)
  values(3,'Edmund Jagiello�ski', 3, 'ponad 60 lat', 'Matejki', '11/5', 'Toru�', 'okazjonalny', 1, 'aktualny')
  SET IDENTITY_INSERT DW.dbo.klient OFF

  
  insert into rozmowa(ID_Daty_Rozmowy, ID_Godziny_Rozpocz�cia, ID_Godziny_Zako�czenia, ID_Agenta, ID_Klienta,
		ID_Sprawy, ID_Czasu_Trwania_Rozmowy, Czas_Oczekiwania, Ocena_Og�lna_Manad�era,Ocena_Zadowolenia_Klienta)
  values(1,1,2,1,1,1,1,13,85,7)
  insert into rozmowa values(1,2,2,2,3,1,2,15,100,3)
  insert into rozmowa values(2,1,2,2,3,1,1,217,80,7)
  