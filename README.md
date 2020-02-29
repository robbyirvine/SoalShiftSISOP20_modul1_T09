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


Soal 1.b
- Deskripsi:
Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
- Pembahasan: 
```echo "2 State profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$11] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2  | awk 'FNR < 3{printf"%s \n", $1$2$3$4$5$6}'
```
```awk -F'\t'``` 
Option -F adalah sebagai separator atau pemisah antar kolom pada tabel tsv

```'FNR > 1{SUM[$11] +=$21}```
perintah ini untuk memuat data setelah row number 1, lalu menampilkan state(kolom 11) beserta profitnya(kolom 21). selanjutnya dijumlahkan per state

```END{for (j in SUM) print j, SUM[j]```
perintah ini untuk menampilkan jumlah profit yang sudah dijumlahkan per region

```Sample-Superstore.tsv```
perintah ini adalah nama file yang datanya ingin diolah

```sort -gk2```
perintah ini untuk mensortir berdasarkan hasil yang didapatkan tadi. ```-g```untuk mensortir general number dan ```k2``` untuk set key terhadap kolom profit(kolom 2).

```awk 'FNR < 3{printf"%s \n", $1$2$3$4$5$6}'```
untuk menampilkan state dengan profit terendah daripada a. ```FNR <3``` perintah ini untuk mendapatkan 2 hasil sortiran yang paling kecil dari sebelumnya dan menampilkannya. 


### Soal 2
Deskripsi:
Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.

Soal 2.ab
- Deskripsi: membuat password acak sebanyak 28 karakter terdiri dari huruf kecil, huruf kapital, dan angka. dan menyimpannya dalam file ekstensi.txt
- Pembahasan: 
```#!/bin/bash

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
file=$(echo $1 | tr -dc 'a-zA-Z').txt

echo $password > $file.txt
```
```password=$(cat /dev/urandom``` untuk mendapatkan password secara acak dan terus-menerus. 

```tr -dc 'a-zA-Z0-9'``` untuk menghasilkan output alphabet dan numerik secara random (```-d```) dan akan menghapus (```c```) kecuali ```a-zA-Z0-9```

```fold -w 28``` meminta sebanyak 28 karakter

```head -n 1``` pada satu baris saja

```file=$(echo $1``` password tadi akan disimpan sebagai argumen ```$1```

```tr -dc 'a-zA-Z').txt``` dengan nama file menggunakan alphabet huruf kapital dan kecil serta file berbentuk txt

```echo $password > $file.txt``` selanjutnya adalah password acak tadi akan disimpan kedalam file.txt 



Keluhan:
- masih belum terlalu familiar dengan bahasa yang digunakan. hal ini mengakibatkan memakan waktu yg lama untuk pengerjaan
- terkadang ada error saat dicoba ke laptop teman satu tim
