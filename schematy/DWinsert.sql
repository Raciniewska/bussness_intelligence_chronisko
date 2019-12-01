  SET IDENTITY_INSERT DW.dbo.czas ON


  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(1,23,23,'od 20 do 23')
  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(2,20,43,'od 16 do 20')
  insert into czas(ID_Czasu, Godzina, Minuta, Pora_Dnia) values(3,8,23,'od 0 do 8')

  SET IDENTITY_INSERT DW.dbo.czas OFF

   SET IDENTITY_INSERT DW.dbo.miesi¹c ON

  insert into miesi¹c(ID_Miesi¹ca, Nazwa, Rok, Iloœæ_Dni_Œwi¹tecznych, Iloœæ_Nowych_Agentów) values(1,'styczeñ',2013,'ma³o','od 3 do 6')
  insert into miesi¹c(ID_Miesi¹ca, Nazwa, Rok, Iloœæ_Dni_Œwi¹tecznych, Iloœæ_Nowych_Agentów) values(2,'luty',2013,'brak','od 0 do 2')
  insert into miesi¹c(ID_Miesi¹ca, Nazwa, Rok, Iloœæ_Dni_Œwi¹tecznych, Iloœæ_Nowych_Agentów) values(3,'marzec',1943,'ma³o','od 0 do 2')
   SET IDENTITY_INSERT DW.dbo.miesi¹c OFF

    SET IDENTITY_INSERT DW.dbo.czas_trwania_rozmowy ON
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia³_Czasowy) values(1,'od 0 do 10')
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia³_Czasowy) values(2,'od 11 do 30')
  insert into czas_trwania_rozmowy(ID_Czasu_Trwania_Rozmowy, Przedzia³_Czasowy) values(3,'od 31 do 120')
      SET IDENTITY_INSERT DW.dbo.czas_trwania_rozmowy OFF

	      SET IDENTITY_INSERT DW.dbo.data ON

  insert into data(ID_Daty, Data, ID_Miesi¹ca, Dzieñ_Tygodnia, Dzieñ_Pracuj¹cy, Czas_Wakacyjny, Œwiêto, Dzieñ_Przedœwi¹teczny)
  values(1,'2013-01-06',1,'poniedzia³ek','wolny','poza wakacjami','Trzech Króli', null)
  insert into data(ID_Daty, Data, ID_Miesi¹ca, Dzieñ_Tygodnia, Dzieñ_Pracuj¹cy, Czas_Wakacyjny, Œwiêto, Dzieñ_Przedœwi¹teczny)
  values(2,'2013-01-07',1,'wtorek','roboczy','poza wakacjami',null, null)
  insert into data(ID_Daty, Data, ID_Miesi¹ca, Dzieñ_Tygodnia, Dzieñ_Pracuj¹cy, Czas_Wakacyjny, Œwiêto, Dzieñ_Przedœwi¹teczny)
  values(3,'1943-03-07',3,'sobota','roboczy','poza wakacjami',null, null)
      SET IDENTITY_INSERT DW.dbo.data OFF

    SET IDENTITY_INSERT DW.dbo.sprawa ON

  insert into sprawa(ID_Sprawy, ID_Daty_Otwarcia, ID_Daty_Zamkniêcia, Czas_Rozwi¹zania, Typ_Sprawy) 
  values(1,1,2,'bardzo szybko','zwrot')
  insert into sprawa(ID_Sprawy, ID_Daty_Otwarcia, ID_Daty_Zamkniêcia, Czas_Rozwi¹zania, Typ_Sprawy) 
  values(2,1,1,'bardzo szybko','informacja')
      SET IDENTITY_INSERT DW.dbo.sprawa OFF

	      SET IDENTITY_INSERT DW.dbo.agent ON

  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imiê_Nazwisko, PESEL, Przedzia³_Wiekowy, Sta¿, Team, Aktualnoœæ)
  values(1,1,'Adam Nowak', 98072652931, 'od 19 do 25 lat', 'do roku', '1','aktualne')
  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imiê_Nazwisko, PESEL, Przedzia³_Wiekowy, Sta¿, Team, Aktualnoœæ)
  values(2,1,'Janina Nowicka', 95012109873, 'od 19 do 25 lat', 'do roku', '1', 'aktualne')
  insert into agent(ID_Agenta, ID_Daty_Zatrudnienia, Imiê_Nazwisko, PESEL, Przedzia³_Wiekowy, Sta¿, Team, Aktualnoœæ)
  values(3,2,'Jan Bober', 85012109873, 'od 26 do 35 lat', 'do 5 lat', '1', 'nieaktualne')
     SET IDENTITY_INSERT DW.dbo.agent OFF

	    SET IDENTITY_INSERT DW.dbo.klient ON
  insert into klient(ID_Klienta,Imiê_Nazwisko, ID_Daty_Urodzenia, Przedzia³_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do³¹czenia,Aktualnoœæ)
  values(1,'Edmund Jagielloñski', 3, 'ponad 60 lat', 'Grunwaldzka', '204a/5', 'Gdañsk', 'sta³y', 1, 'aktualny')
  insert into klient(ID_Klienta,Imiê_Nazwisko, ID_Daty_Urodzenia, Przedzia³_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do³¹czenia,Aktualnoœæ)
  values(2,'Danuta Ochocka', 3, 'ponad 60 lat', 'Ruska', '20a', 'Wroc³aw', 'nowy', 1, 'aktualny')
  insert into klient(ID_Klienta,Imiê_Nazwisko, ID_Daty_Urodzenia, Przedzia³_Wiekowy, Ulica, Numer_Domu, Miasto,Status,ID_Daty_Do³¹czenia,Aktualnoœæ)
  values(3,'Edmund Jagielloñski', 3, 'ponad 60 lat', 'Matejki', '11/5', 'Toruñ', 'okazjonalny', 1, 'aktualny')
  SET IDENTITY_INSERT DW.dbo.klient OFF

  
  insert into rozmowa(ID_Daty_Rozmowy, ID_Godziny_Rozpoczêcia, ID_Godziny_Zakoñczenia, ID_Agenta, ID_Klienta,
		ID_Sprawy, ID_Czasu_Trwania_Rozmowy, Czas_Oczekiwania, Ocena_Ogólna_Manad¿era,Ocena_Zadowolenia_Klienta)
  values(1,1,2,1,1,1,1,13,85,7)
  insert into rozmowa values(1,2,2,2,3,1,2,15,100,3)
  insert into rozmowa values(2,1,2,2,3,1,1,217,80,7)
  