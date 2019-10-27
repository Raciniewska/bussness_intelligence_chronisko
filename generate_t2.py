import random
from datetime import datetime
from datetime import timedelta
import math
import secrets
import string

koniec_czasu = datetime.strptime('2019-12-27', '%Y-%m-%d')
rozpo_czasu=datetime.strptime('2019-10-27', '%Y-%m-%d')
urodzenie_start = datetime.strptime('1919-10-26', '%Y-%m-%d')
urodzenie_koniec = datetime.strptime('2001-10-26', '%Y-%m-%d')
maile = ['gmail','onet','wp','o2']

def random_date(start, end):
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = random.randrange(int_delta)
    return start + timedelta(seconds=random_second)

#KLIENT BULK
print("Ile ma byc klientow?")
#liczba_klientow = input()
liczba_klientow = 100
imiona_d = open('dane_do_generowania/imiona_damskie_polskie.txt',encoding="utf-8").read().splitlines()
imiona_m = open('dane_do_generowania/imiona_meskie_polskie.txt',encoding="utf-8").read().splitlines()
nazwiska_d = open('dane_do_generowania/nazwiska_damskie_polskie.txt',encoding="utf-8").read().splitlines()
nazwiska_m = open('dane_do_generowania/nazwiska_meskie_polskie.txt',encoding="utf-8").read().splitlines()
klient_bulk=open("bulks_t2/klient_t2.bulk", "w",encoding="utf-8")
miasta = open('dane_do_generowania/ludnosc_do_miasta.txt',encoding="utf-8").read().splitlines()
ulice = open('dane_do_generowania/ulice_polskie.txt',encoding="utf-8").read().splitlines()
liczba_starych_klientow=len(open('bulks/klient.bulk',encoding="utf-8").read().splitlines())
for id in range(liczba_klientow):
    if random.randrange(20) % 2 == 0:
        klient_bulk.write(str(liczba_starych_klientow+id + 1) + "|" + imiona_d[random.randint(0,len(imiona_d)-1)] + "|" + nazwiska_d[random.randint(0,len(nazwiska_d)-1)])
    else:
        klient_bulk.write(str(liczba_starych_klientow+id + 1) + "|" + imiona_m[random.randint(0,len(imiona_m)-1)] + "|" + nazwiska_m[random.randint(0,len(nazwiska_m)-1)])
    klient_bulk.write("|" +miasta[random.randrange(0,len(miasta)-1,1)].split(',')[1]+"|"+random.choice(ulice)+
    str(random.randint(1,200))+"/"+str(random.randint(1,50))+"|" + str(random.randrange(100000000, 999999999, 1)) + "|" +
    str(random_date(urodzenie_start,urodzenie_koniec).date()) +"|"+ ''.join(secrets.choice(string.ascii_uppercase + string.digits) for _ in range(12))
    +"@"+maile[random.randint(0,len(maile)-1)]+".com"+"\n")
id = 0
klient_bulk.close()

del miasta[:]
del ulice[:]
del imiona_d[:]
del imiona_m[:]
del nazwiska_d[:]
del nazwiska_m[:]

#FABRYKA BULK
f = open("dane_do_generowania/fabryka_nazwa_i_adres_t2.txt", "r",encoding="utf-8")
liczba_fabryk = len(open('dane_do_generowania/fabryki_nazwa_i_adres.txt',encoding="utf-8").read().splitlines())
fabryka_bulk=open("bulks_t2/fabryka_t2.bulk", "w",encoding="utf-8")
id=liczba_fabryk+1
for line in f:
    fabryka_bulk.write(str(id)+"|"+line.split(' ')[0]+"|"+" ".join(str(x) for x in line.split()[1:])+"\n")
    id = id + 1
    liczba_fabryk=liczba_fabryk +1
id = 0
f.close()
fabryka_bulk.close()

#TODO naprawa czasu produkcji
#PRODUKT BULK
produkt_bulk=open("bulks_t2/produkt_t2.bulk", "w",encoding="utf-8")
nazwy_producentow = open('dane_do_generowania/producenci.txt',encoding="utf-8").read().splitlines()
liczba_magazynow = len(open('dane_do_generowania/magazyn_nazwa_i_adres.txt',encoding="utf-8").read().splitlines())
liczba_produktow = len(open('bulks/produkt.bulk',encoding="utf-8").read().splitlines())
for id in range(len(nazwy_producentow)):
    produkt_bulk.write(str(liczba_produktow+1)+"|"+"brytwanna szklana"+"|"+str(random.randint(15,1000))+"."+str(random.randint(0,99))
    +"|"+nazwy_producentow[id]+"|" + str(random_date(rozpo_czasu,koniec_czasu).date())+"|"+
    str(random.randint(1,liczba_fabryk))+"|"+str(random.randint(1,liczba_magazynow))+"\n")
    liczba_produktow=liczba_produktow+1
id=0
produkt_bulk.close()
del nazwy_producentow[:]

#ZAMOWIENiE_BULK
zamowienie_bulk=open("bulks_t2/zamowienie_t2.bulk", "w",encoding="utf-8")
print("Ile ma byc zamowien?")
#liczba_zamowien = input()
liczba_zamowien = 1000
liczba_starych_zam=len(open('bulks/zamowienie.bulk',encoding="utf-8").read().splitlines())
nazwy_platnosci = open('dane_do_generowania/typ_platnosci.txt',encoding="utf-8").read().splitlines()
liczba_klientow = len(open('bulks_t2/klient_t2.bulk',encoding="utf-8").read().splitlines())
liczba_starych_klientow = len(open('bulks/klient.bulk',encoding="utf-8").read().splitlines())
liczba_agentow = len(open('bulks/agent.bulk',encoding="utf-8").read().splitlines())
liczba_kurierow = len(open('bulks/kurier.bulk',encoding="utf-8").read().splitlines())
for id in range(liczba_zamowien):
    zamowienie_bulk.write(str(liczba_starych_zam+1) + "|"
                          +str(random.randint(1,liczba_klientow+liczba_starych_klientow))+"|"
    +str(random.randint(1,liczba_agentow))+"|"
                          +str(random.randint(1,liczba_kurierow))+"|"+
    str(random_date(rozpo_czasu, koniec_czasu).date())
                          +"|"+ nazwy_platnosci[random.randint(0,len(nazwy_platnosci)-1)]+"\n")
    liczba_starych_zam=liczba_starych_zam+1

id=0
zamowienie_bulk.close()


def check_if_on_list(lista,produkt):
    for i in lista:
        if(i == produkt) :
            return True
    return False

#PRODUKT DO ZAMOWIENIA BULK
prod_do_zam_bulk=open("bulks_t2/produkt_do_zamowienia_t2.bulk", "w",encoding="utf-8")
id_do_zam=liczba_zamowien
for id in range(liczba_zamowien):
    produkty=[]
    for ile_prod in range(1,3):
        produkt = random.randint(1, liczba_produktow)
        while check_if_on_list(produkty,produkt):
            produkt = random.randint(1, liczba_produktow)
        produkty.append(produkt)
        for item in produkty:
            prod_do_zam_bulk.write(str(item)+"|"+str(id_do_zam+1)+"|"+str(random.randrange(1,10))+"|"+str(random.randint(15,1000))+"."+str(random.randint(0,99))+"\n")
        id_do_zam=id_do_zam+1
id=0
prod_do_zam_bulk.close()

#SPRAWA BULK
sprawa_bulk=open("bulks_t2/sprawa_t2.bulk", "w",encoding="utf-8")
liczba_spraw=math.ceil(liczba_zamowien/10)
szczeg_zam = open('bulks_t2/zamowienie_t2.bulk', encoding="utf-8").read().splitlines()
typ_sprawy = open('dane_do_generowania/typy_spraw.txt', encoding="utf-8").read().splitlines()
liczba_starych_zam=len(open('bulks/zamowienie.bulk',encoding="utf-8").read().splitlines())
liczba_starych_spraw=len(open('bulks/sprawa.bulk',encoding="utf-8").read().splitlines())
for id in range(liczba_spraw):
    numer_zam=random.randint(1,liczba_zamowien)
    data_pocz_zam=datetime.strptime(szczeg_zam[numer_zam-1].split('|')[4],'%Y-%m-%d')
    data_pocz_zam = random_date(data_pocz_zam,koniec_czasu)
    roznica_czasu=(koniec_czasu-data_pocz_zam).days
    if roznica_czasu==0:
        zakonczenie=koniec_czasu
    else:
        zakonczenie=random_date(data_pocz_zam,koniec_czasu)
    klient = szczeg_zam[numer_zam-1].split('|')[1]
    #TODO sprawdzac produkt do zamowienia
    sprawa_bulk.write(str(liczba_starych_spraw+id + 1) + "|" +str(data_pocz_zam.date())+"|"+str(zakonczenie.date())+"|"+
        klient+"|"+str(random.randint(1,liczba_agentow))+"|"+str(numer_zam)+"|"+str(random.randint(1,liczba_produktow))+"|"+typ_sprawy[random.randint(0,len(typ_sprawy)-1)]+"\n")
id=0
sprawa_bulk.close()
del szczeg_zam[:]


#ROZMOWA BULK
rozmowa_bulk=open("bulks_t2/rozmowa_t2.bulk", "w",encoding="utf-8")
print("Ile ma byc faktow?")
szczeg_sprawy = open('bulks_t2/sprawa_t2.bulk', encoding="utf-8").read().splitlines()
liczba_starych_rozmow=len(open('bulks/rozmowa.bulk',encoding="utf-8").read().splitlines())
#liczba_faktow = input()
liczba_faktow = 5*liczba_spraw
for id in range(liczba_faktow):
    #TODO powiazac rozmowe z odpowiednim klientem
    numer_sprawy=random.randrange(1,liczba_spraw)
    data_pocz_spr = datetime.strptime(szczeg_sprawy[numer_sprawy - 1].split('|')[1], '%Y-%m-%d')
    data_pocz_spr = random_date(data_pocz_spr, koniec_czasu)
    rozmowa_bulk.write(str(liczba_starych_rozmow+id + 1) + "|"+str(random.randint(0,6000))+"|"+str(random.randint(1,liczba_klientow+liczba_starych_klientow))
                       +"|"+str(random.randrange(1,liczba_agentow))+"|"+str(numer_sprawy+liczba_starych_spraw)
                       +"|"+str(data_pocz_spr)+"|"+str(data_pocz_spr+timedelta(seconds=random.randint(1,2400)))+"\n")
id=0
rozmowa_bulk.close()