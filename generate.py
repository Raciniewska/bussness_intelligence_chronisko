import random
import enum
from datetime import datetime
from datetime import timedelta
import secrets
import string
import math
import codecs

rozp_zatrudniania = datetime.strptime('2000-05-04', '%Y-%m-%d')
teraz = datetime.strptime('2019-10-26', '%Y-%m-%d')
urodzenie_start = datetime.strptime('1919-10-26', '%Y-%m-%d')
urodzenie_koniec = datetime.strptime('2001-10-26', '%Y-%m-%d')
rozp_produkcji=datetime.strptime('1998-05-04', '%Y-%m-%d')
maile = ['gmail','onet','wp','o2']




def random_date(start, end):
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = random.randrange(int_delta)
    return start + timedelta(seconds=random_second)
#MAGAZYN.BULK
f = open("dane_do_generowania/magazyn_nazwa_i_adres.txt", "r",encoding="utf-8")
magazyn_bulk=open("bulks/magazyn.bulk", "w",encoding='utf-8')
counter = 0
id = 0
liczba_magazynow=0
for line in f:
    magazyn_bulk.write(str(counter+1)+"|"+line.split(' ')[0]+"|"+str(counter))
    for i in range(8):
        magazyn_bulk.write(str(random.randrange(0,9)))
    magazyn_bulk.write("|"+" ".join(str(x) for x in line.split()[1:])+"\n")
    counter=counter+1
    id = id + 1
    if counter>9:
        counter=0
    liczba_magazynow=liczba_magazynow+1
counter = 0
id = 0
f.close()
magazyn_bulk.close()

#FABRYKA BULK
f = open("dane_do_generowania/fabryki_nazwa_i_adres.txt", "r",encoding="utf-8")
fabryka_bulk=open("bulks/fabryka.bulk", "w",encoding='utf-8')
liczba_fabryk=0
for line in f:
    fabryka_bulk.write(str(id+1)+"|"+line.split(' ')[0]+"|"+" ".join(str(x) for x in line.split()[1:])+"\n")
    id = id + 1
    liczba_fabryk=liczba_fabryk +1
id = 0
f.close()
fabryka_bulk.close()

#AGENT BULK
print("Ile agentow ma pracować w firmie?")
agent_bulk=open("bulks/agent.bulk", "w", encoding='utf-8')
#agent_bulk.write(codecs.BOM_utf-8)
imiona_d = open('dane_do_generowania/imiona_damskie_polskie.txt', encoding='utf-8').read().splitlines()
imiona_m = open('dane_do_generowania/imiona_meskie_polskie.txt', encoding='utf-8').read().splitlines()
nazwiska_d = open('dane_do_generowania/nazwiska_damskie_polskie.txt',encoding='utf-8').read().splitlines()
nazwiska_m = open('dane_do_generowania/nazwiska_meskie_polskie.txt',encoding='utf-8').read().splitlines()
#liczba_agentow = input()
liczba_agentow = 25
for id in range(liczba_agentow):
    if random.randrange(20) % 2 == 0:
       agent_bulk.write(str(id+1)+"|"+random.choice(imiona_d)+"|"+random.choice(nazwiska_d))
    else :
        agent_bulk.write(str(id+1) + "|" + (random.choice(imiona_m)) +"|"+ random.choice(nazwiska_m))
    agent_bulk.write("|"+str(random.randrange(10000000000,99999999999,1))+"|"+str(random_date(rozp_zatrudniania, teraz).date())+"\n")
id =0
agent_bulk.close()

#KLIENT BULK
print("Ile ma byc klientow?")
#liczba_klientow = input()
liczba_klientow = 10000
klient_bulk=open("bulks/klient.bulk", "w",encoding='utf-8')
miasta = open('dane_do_generowania/ludnosc_do_miasta.txt',encoding="utf-8").read().splitlines()
ulice = open('dane_do_generowania/ulice_polskie.txt',encoding="utf-8").read().splitlines()
for id in range(liczba_klientow):
    if random.randrange(20) % 2 == 0:
        klient_bulk.write(str(id + 1) + "|" + imiona_d[random.randint(0,len(imiona_d)-1)] + "|" + nazwiska_d[random.randint(0,len(nazwiska_d)-1)])
    else:
        klient_bulk.write(str(id + 1) + "|" + imiona_m[random.randint(0,len(imiona_m)-1)] + "|" + nazwiska_m[random.randint(0,len(nazwiska_m)-1)])
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


#PRODUKT BULK
produkt_bulk=open("bulks/produkt.bulk", "w",encoding='utf-8')
nazwy_produktow = open('dane_do_generowania/nazwy_produktow.txt',encoding="utf-8").read().splitlines()
nazwy_producentow = open('dane_do_generowania/producenci.txt',encoding="utf-8").read().splitlines()
liczba_produktow=len(nazwy_producentow)*len(nazwy_produktow)+1
for id in range(len(nazwy_producentow)*len(nazwy_produktow)):
    produkt_bulk.write(str(id+1)+"|"+nazwy_produktow[id%len(nazwy_produktow)]+"|"+str(random.randint(15,1000))+"."+str(random.randint(0,99))
    +"|"+nazwy_producentow[math.ceil(id/len(nazwy_produktow))-1]+"|" + str(random_date(rozp_produkcji,teraz).date())+"|"+
    str(random.randint(1,liczba_fabryk))+"|"+str(random.randint(1,liczba_magazynow))+"\n")
id=0
produkt_bulk.close()
del nazwy_producentow[:]
del nazwy_produktow[:]

#KURIER_BULK
kurier_bulk=open("bulks/kurier.bulk", "w",encoding='utf-8')
nazwy_kurierow = open('dane_do_generowania/nazwy_kurierow.txt',encoding="utf-8").read().splitlines()
liczba_kurierow = len(nazwy_kurierow)
for id in range(len(nazwy_kurierow)):
    kurier_bulk.write(str(id + 1) + "|"+nazwy_kurierow[id]+"\n")
id=0
kurier_bulk.close()
del nazwy_kurierow[:]

#ZAMOWIENiE_BULK
zamowienie_bulk=open("bulks/zamowienie.bulk", "w",encoding='utf-8')
print("Ile ma byc zamowien?")
#liczba_zamowien = input()
liczba_zamowien = 100000
nazwy_platnosci = open('dane_do_generowania/typ_platnosci.txt',encoding="utf-8").read().splitlines()
for id in range(liczba_zamowien):
    zamowienie_bulk.write(str(id + 1) + "|" +str(random.randint(1,liczba_klientow))+"|"
    +str(random.randint(1,liczba_agentow))+"|"+str(random.randint(1,liczba_kurierow))+"|"+
    str(random_date(rozp_zatrudniania,teraz).date())+"|"+nazwy_platnosci[random.randint(0,len(nazwy_platnosci)-1)]+"\n")
id=0
zamowienie_bulk.close()

def check_if_on_list(lista,produkt):
    for i in lista:
        if(i == produkt) :
            return True
    return False

#PRODUKT DO ZAMOWIENIA BULK
prod_do_zam_bulk=open("bulks/produkt_do_zamowienia.bulk", "w",encoding='utf-8')
for id in range(liczba_zamowien):
    produkty=[]
    for ile_prod in range(1,6):
        produkt = random.randint(1, liczba_produktow)
        while check_if_on_list(produkty,produkt):
            produkt = random.randint(1, liczba_produktow)
        produkty.append(produkt)
        for item in produkty:
            prod_do_zam_bulk.write(str(item)+"|"+str(id+1)+"|"+str(random.randrange(1,10))+"|"+str(random.randint(15,1000))+"."+str(random.randint(0,99))+"\n")
id=0
prod_do_zam_bulk.close()

#SPRAWA BULK
sprawa_bulk=open("bulks/sprawa.bulk", "w",encoding='utf-8')
liczba_spraw=10000
szczeg_zam = open('bulks/zamowienie.bulk', encoding="utf-8").read().splitlines()
typ_sprawy = open('dane_do_generowania/typy_spraw.txt', encoding="utf-8").read().splitlines()
for id in range(liczba_spraw):
    numer_zam=random.randint(1,liczba_zamowien)
    data_pocz_zam=datetime.strptime(szczeg_zam[numer_zam-1].split('|')[4],'%Y-%m-%d')
    data_pocz_zam = random_date(data_pocz_zam,teraz)
    roznica_czasu=(teraz-data_pocz_zam).days
    if roznica_czasu==0:
        zakonczenie=teraz
    else:
        zakonczenie=random_date(data_pocz_zam,teraz)
    klient = szczeg_zam[numer_zam-1].split('|')[1]
    #TODO sprawdzac produkt do zamowienia
    sprawa_bulk.write(str(id + 1) + "|" +str(data_pocz_zam.date())+"|"+str(zakonczenie.date())+"|"+
        klient+"|"+str(random.randint(1,liczba_agentow))+"|"+str(numer_zam)+"|"+str(random.randint(1,liczba_produktow))+"|"+typ_sprawy[random.randint(0,len(typ_sprawy)-1)]+"\n")
id=0
sprawa_bulk.close()
del szczeg_zam[:]

#ROZMOWA BULK
rozmowa_bulk=open("bulks/rozmowa.bulk", "w",encoding='utf-8')
print("Ile ma byc faktow?")
szczeg_sprawy = open('bulks/sprawa.bulk', encoding="utf-8").read().splitlines()
#liczba_faktow = input()
liczba_faktow = 50000
for id in range(liczba_faktow):
    #TODO powiazac rozmowe z odpowiednim klientem
    numer_sprawy=random.randrange(1,liczba_spraw)
    data_pocz_spr = datetime.strptime(szczeg_sprawy[numer_sprawy - 1].split('|')[1], '%Y-%m-%d')
    data_pocz_spr = random_date(data_pocz_spr, teraz)
    rozmowa_bulk.write(str(id + 1) + "|"+str(random.randint(0,6000))+"|"+str(random.randint(1,liczba_klientow))
                       +"|"+str(random.randrange(1,liczba_agentow))+"|"+str(numer_sprawy)
                       +"|"+str(data_pocz_spr)+"|"+str(data_pocz_spr+timedelta(seconds=random.randint(1,2400)))+"\n")
id=0
rozmowa_bulk.close()