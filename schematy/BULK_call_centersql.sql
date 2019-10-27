use CallCenter
go


BULK INSERT dbo.magazyn FROM 'D:\bulki\magazyn.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.firma_kurierska FROM 'D:\bulki\kurier.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.fabryka FROM 'D:\bulki\fabryka.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.klient FROM 'D:\bulki\klient.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.agent FROM 'D:\bulki\agent.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.zamowienie FROM 'D:\bulki\zamowienie.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.produkt FROM 'D:\bulki\produkt.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.sprawa FROM 'D:\bulki\sprawa.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.rozmowa FROM 'D:\bulki\rozmowa.bulk' WITH (FIELDTERMINATOR='|')
BULK INSERT dbo.produkty_w_zamowieniu FROM 'D:\bulki\produkt_do_zamowienia.bulk' WITH (FIELDTERMINATOR='|')
