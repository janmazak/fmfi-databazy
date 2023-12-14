# Domáce úlohy

Odovzdať do **13. 12. 2022** 23:59 e-mailom, alebo na papieri na cvičeniach.

## 1. Normalizácia

Uvažujme databázu univerzitných kurzov
```
R = (course_id, course_title, department_name, credits,   semester, year,

     building,  room_number,  room_capacity,   time_slot, lecturer),
```
v skrátenej verzii
```
R = (C,         T,            D,               V,         S,        Y,

     B,         R,            N,               X,         L).
```

V relácii R platia tieto funkčné závislosti:
* `C -> TDV` (ak vieme ID kurzu, poznáme jeho názov, katedru, pod ktorú patrí, aj priradené kredity)
* `BR -> N` (miestnosť má jednoznačne určenú kapacitu)
* `CSY -> BRXL` (v danom roku a semestri má kurz priradenú miestnosť, hodiny v rozvrhu aj prednášajúceho)

1. Nájdite všetky kľúče R.

2. Dekomponujte R do BCNF zachovávajúcej všetky funkčné závislosti (alebo dokážte, že to nejde) a zdôvodnite, že naozaj je v BCNF a spája sa bezstratovo.

3. Pridajme ešte jednu funkčnú závislosť: `L -> D` (prednášajúci je členom katedry). Je možné dekompozíciu nájdenú v 2. upraviť tak, aby sa zachovala BCNF aj všetky funkčné závislosti? Svoju odpoveď zdôvodnite. 

