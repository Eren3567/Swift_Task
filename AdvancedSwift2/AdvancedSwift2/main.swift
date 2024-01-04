//
//  main.swift
//  AdvancedSwift2
//
//  Created by Eren Çetintaş on 5.01.2024.
//


import Foundation


let Classkullanım = UserClass (isim: "isim", yas: 30, meslek: "meslek")

print(Classkullanım.isim)

var StructKullanim = UserStuct(isim: "isim1", yas: 32, meslek: "meslek2")
print(StructKullanim.isim)

Classkullanım.isim = "isim3"
StructKullanim.isim = "isim4"
print(Classkullanım.isim)
print(StructKullanim.isim)

var yeniclass = Classkullanım.yas
 yeniclass = 25

print(yeniclass)

var yenistruct = StructKullanim.yas

yenistruct = 26
print(yenistruct)

print(Classkullanım.yas)
print(StructKullanim.yas)

Classkullanım.birartir()

let benimtuple = ("ad",[1,2,3,4,5])

print(benimtuple.1[2])

let yeniden = (isim : "isimler", soyad : "soyadlar")

print(yeniden.soyad)

