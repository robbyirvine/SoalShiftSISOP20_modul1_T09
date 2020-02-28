# SoalShiftSISOP20_modul1_T09

### Kelompok T09
- Robby Irvine Surya (05311840000023)
- Widyantari Febiyanti (05311840000030)

### Soal 1
Deskripsi:
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file "Sample-Superstore.tsv". Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa:

Soal 1.a.
- Deskripsi:
Tentukan wilayah bagian (region) mana yang memiliki keuntungan paling sedikit
- Pembahasan: 
```#!/bin/bash

echo "Region profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2{print$1}'
```
```awk -F'\t'``` 
Option -F adalah sebagai separator atau pemisah antar kolom pada tabel tsv

```'FNR > 1{SUM[$13] +=$21}```
perintah ini untuk memuat data setelah row number 1, lalu menampilkan region(kolom 13) beserta profitnya(kolom 21). selanjutnya dijumlahkan per region

```END{for (j in SUM) print j, SUM[j]}```
perintah ini untuk menampilkan jumlah profit yang sudah dijumlahkan per region

```Sample-Superstore.tsv```
perintah ini adalah nama file yang datanya ingin diolah

```sort -gk2```
perintah ini untuk mensortir berdasarkan hasil yang didapatkan tadi. ```-g```untuk mensortir general number dan ```k2``` untuk set key terhadap kolom profit(kolom 2).

```awk 'FNR < 2{print$1}```
untuk menampilkan region dengan profit terendah. ```FNR <2``` perintah ini untuk mendapatkan hasil sortiran yang paling kecil dan ```print $1```menampilkan region yang memiliki profit terendah


Soal 2.a
- Deskripsi:
Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
- Pembahasan: 
```echo "2 State profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$11] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2  | awk 'FNR < 3{printf"%s \n", $1$2$3$4$5$6}'
```
