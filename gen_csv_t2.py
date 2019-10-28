import random
from datetime import *
import secrets
import string
from shutil import copyfile

def monthdelta(date, delta):
    m, y = (date.month+delta) % 12, date.year + (date.month+delta-1) // 12
    if not m: m = 12
    d = min(date.day, [31, 29 if y % 4 == 0 and not y % 400 == 0 else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m-1])
    return date.replace(day=d,  month=m, year=y)

def random_date(start, end):
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = random.randrange(int_delta)
    return start + timedelta(seconds=random_second)

urodzenie_start = datetime.strptime('1919-10-26', '%Y-%m-%d')
urodzenie_koniec = datetime.strptime('2001-10-26', '%Y-%m-%d')
maile = ['gmail','onet','wp','o2']

rozmowy = open("bulks_t2/rozmowa_t2.bulk", encoding="utf-8")
miasta = open('dane_do_generowania/ludnosc_do_miasta.txt', encoding="utf-8").read().splitlines()
ulice = open('dane_do_generowania/ulice_polskie.txt', encoding="utf-8").read().splitlines()

#---------------------------------------------#
#-------------ANKIETA KLIENTA-----------------#

copyfile("arkusze_csv/ankieta_klienta.csv", "arkusze_csv_t2/ankieta_klienta_t2.csv")
ankieta_klienta_t2 = open("arkusze_csv_t2/ankieta_klienta_t2.csv", mode='a+', encoding="utf-8")
print("Jaki procent klientów ma wypełniac ankietę po rozmowie?")
#procent_klientow = input()
procent_klientow = 10

#ankieta klienta wpierw
#ankieta_klienta_t2.write("id_rozmowy, id_klienta, Ogólne zadowolenie z rozmowy, Poziom kompetencji obsługującego pracownika, Miara spełnionych oczekiwań naszych produktów"+'\n')
for line in rozmowy:
    id_rozmowy = line.split('|')[0]
    id_klienta = line.split('|')[2]
    zapis = random.randrange(100) < procent_klientow
    if zapis:
        #sprawdzenie czy rozmowa miałą miejsce w ciagu ostatniego miesiaca
        #bo założyliśmy że oceny spadły
        sub = (str(monthdelta((date.today()), -1)) < line.split('|')[5].split(' ')[0])
        if sub:
            randrange = 9
        else:
            randrange = 10
        wpis = ""
        wpis+=id_rozmowy+','+id_klienta+','+str(random.randrange(randrange)+1)+','\
        +str(random.randrange(randrange)+1)+','+str(random.randrange(randrange)+1)+'\n'
        ankieta_klienta_t2.write(wpis)
ankieta_klienta_t2.close()

#---------------------------------------------#
#-------------ANKIETA MANAGERA 1----------------#

copyfile("arkusze_csv/arkusz_managera_1.csv", "arkusze_csv_t2/arkusz_managera_1_t2.csv")



#---------------------------------------------#
#-------------ANKIETA MANAGERA 2----------------#

copyfile("arkusze_csv/arkusz_managera_2.csv", "arkusze_csv_t2/arkusz_managera_2_t2.csv")
rozmowy = open("bulks/rozmowa.bulk", encoding="utf-8")
ankieta_menagera = open("arkusze_csv_t2/arkusz_managera_2_t2.csv", mode = 'a+', encoding="utf-8")
#ankieta_menagera.write("identyfikator rozmowy, numer pracownika, ocena ogólna jakości, "
#                       "ocena rzeczowości, ocena uprzejmości, ocena cieprliwości, "
 #                      "ocena poprawności podanych informacji, data przeprowadzenia oceny" + '\n')
for line in rozmowy:
    if random.randrange(10) < 3:            #nie wszystkie rozmowy są oceniane
        id_rozmowy = str(line.split('|')[0])
        id_pracownika = str(line.split('|')[3])
        sub = (str(monthdelta((date.today()), -1)) < line.split('|')[5].split(' ')[0])
        if sub:
            randrange = 90
        else:
            randrange = 100
        ooj = str(random.randrange(randrange)+1)
        oor = str(random.randrange(randrange)+1)
        ou = str(random.randrange(randrange) + 1)
        oc = str(random.randrange(randrange) + 1)
        oppi = str(random.randrange(randrange) + 1)
        data_oceny = str(random_date(datetime.strptime(line.split('|')[5].split(' ')[0], '%Y-%m-%d'), datetime.now()))
        data_oceny = data_oceny.split(' ')[0]
        wpis2 = id_rozmowy+","+id_pracownika+","+ooj+","+oor+","+ou+","+oc+","+oppi+","+str(data_oceny)+'\n'
        ankieta_menagera.write(wpis2)
