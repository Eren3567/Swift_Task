//
//  main.swift
//  Uygulama
//
//  Created by Eren Çetintaş on 21.07.2024.
//

import Foundation


class vvvv {
    func kisiBilgisi(ad: String, yas: Int) -> String {
        let mesaj = "Merhaba \(ad)! \(yas) yaşındasınız."
        return mesaj
    }
    
    
}
    let yap = vvvv()

print(yap.kisiBilgisi(ad: "fff", yas: 4))

func dikdortgenHesapla(genislik: Int, yukseklik: Int) ->  (ilk: Int, ikinci:  Int) {
    let alan = genislik * yukseklik
    let cevre = 2 * (genislik + yukseklik)
    return (alan, cevre)
}

let ab = dikdortgenHesapla(genislik: 2, yukseklik: 5)

print(ab.ikinci)

//--------------------------------------------------------------------
func ogrenciOrtalamasi(isim: String, notlar: [Int]) -> (ad: Int, ortalama: Double) {
    var toplam = 0
       var index = 0
       
       while index < notlar.count {
           toplam += notlar[index]
           index += 1
       }
    
   /* var toplam = 0
        
        for not in notlar {
            toplam += not
        }
    */
    let ortalama = Double(toplam) / Double(notlar.count)
    return (toplam, ortalama)
}


// Fonksiyonu çağırarak kullanmak
let sonuc = ogrenciOrtalamasi(isim: "aa", notlar: [85, 90, 78, 92])
print("Öğrenci: \(sonuc.ad), Ortalama: \(sonuc.ortalama)")
//-------------------------------------------------------------------

// Harf notunu hesaplayan yardımcı fonksiyon
func harfNotuHesapla(not: Int) -> String {
    switch not {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

// Öğrencinin ders adlarını ve notlarını alarak harf notlarını hesaplayan fonksiyon
func dersHarfNotlari(ad: String, dersler: [String: Int]) -> (ad: String, harfNotlari: [String: String]) {
    var harfNotlari: [String: String] = [:]
    
   
    for keyValuePair in dersler {
           let ders = keyValuePair.key
           let not1 = keyValuePair.value
           harfNotlari[ders] = harfNotuHesapla(not: not1)
       }
     //------
   /* let harfNotlari = Dictionary(uniqueKeysWithValues: dersler.map { ($0.key, harfNotuHesapla(not: $0.value)) })

    */
    
    //-------
   /* for (ders, not1) in dersler {
        harfNotlari[ders] = harfNotuHesapla(not: not1)
    }
    //--------
    */
    return (ad, harfNotlari)
}

// Fonksiyonu çağırarak kullanmak
let derslerNotlari = [
    "Matematik": 85,
    "Fizik": 92,
    "Kimya": 76,
    "Biyoloji": 88
]

let sonuc1 = dersHarfNotlari(ad: "Ali", dersler: derslerNotlari)
print("Öğrenci: \(sonuc1.ad), Harf Notları: \(sonuc1.harfNotlari)")



//----------------------------------------------------------------------

let sayilar = [1, 2, 3, 4, 5]

let carp = { (sayi: Int) -> Int in
    return sayi * 2
}

//func carp(sayi: Int) -> Int {
  //  return sayi * 2}


let carpilanSayilar = sayilar.map(carp)

print("Çarpılan Sayılar: \(carpilanSayilar)")

//------------------------------------------------------------------------
let addNumbers = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = addNumbers(5, 3)
print(result) // Çıktı: 8


//---------------------------------------------------------------------

// Ortalama hesaplamak için closure tanımlayalım
let average: ([Int]) -> Double = { numbers in
    let sum = numbers.reduce(0, +)  // Liste elemanlarını toplar
    return Double(sum) / Double(numbers.count)  // Ortalama hesaplar
}

// Örnek bir sayı listesi
let numbers = [4, 8, 15, 16, 23, 42]

// Closure'ı kullanarak ortalamayı hesaplayalım
let avg = average(numbers)

// Sonucu yazdıralım
print(avg)  // 18.0



//-------------------------------------------------------------------------

// Temel sınıf (Super class)
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Some generic animal sound")
    }
}

// Türemiş sınıf (Sub class)
class Dog: Animal {
    // Türemiş sınıfta özelleştirilmiş bir metod
    override func makeSound() {
        print("Woof!")
        
        super.makeSound()
    }
}

// Türemiş sınıfı kullanarak bir nesne oluşturma
let myDog = Dog(name: "nnnn")
myDog.makeSound()  // "Woof!"
//print(myDog.name)  // "Buddy"



//-------------------------------------------------------------------------

// Bir `Set` oluşturma ve eleman ekleme
var meyveler: Set<String> = ["Elma", "Muz", "Çilek"]

// Yeni bir eleman ekleme
meyveler.insert("Portakal")

// Aynı elemanı tekrar eklemeye çalışalım (setlerde birden fazla aynı eleman olamaz)
meyveler.insert("Elma")

// Elemanları yazdırma
print("Meyveler: \(meyveler)")

// Belirli bir elemanı çıkarma
meyveler.remove("Muz")

// Set'te belirli bir elemanın olup olmadığını kontrol etme
if meyveler.contains("Çilek") {
    print("Çilek setin içinde!")
} else {
    print("Çilek setin içinde değil!")
}

// Set'in eleman sayısını öğrenme
print("Set'te \(meyveler.count) adet meyve var.")

// Bir başka `Set` ile kesişim, birleşim, fark ve simetrik fark işlemleri
let tropikalMeyveler: Set = ["Mango", "Portakal", "Ananas", "Çilek"]

// Kesişim (ortak elemanlar)
let ortakMeyveler = meyveler.intersection(tropikalMeyveler)
print("Ortak meyveler: \(ortakMeyveler)")

// Birleşim (tüm elemanlar)
let tumMeyveler = meyveler.union(tropikalMeyveler)
print("Tüm meyveler: \(tumMeyveler)")

// Fark (bir sette olup diğerinde olmayanlar)
let sadeceMeyveler = meyveler.subtracting(tropikalMeyveler)
print("Sadece meyveler: \(sadeceMeyveler)")

// Simetrik fark (her iki sette olup kesişimde olmayanlar)
let farkliMeyveler = meyveler.symmetricDifference(tropikalMeyveler)
print("Farklı meyveler: \(farkliMeyveler)")

//-----------------------------------------------------------------------


// Üç öğeli bir Int tuple tanımlayalım
let numbers1: (Int, Int, Int, Int) = (1, 2, 3, 4)

// Tuple öğelerine indekslerle erişelim
let firstNumber = numbers1.0
let secondNumber = numbers1.1
let thirdNumber = numbers1.2
let fourtNumber = numbers1.3
print("First number: \(firstNumber)")    // First number: 1
print("Second number: \(secondNumber)")  // Second number: 2
print("Third number: \(thirdNumber)")    // Third number: 3
print("Fourth number: \(fourtNumber)")
// Tuple içindeki öğeleri döngü ile yazdıralım
let arrayLikeTuple: (Int, Int, Int) = (4, 5, 6)
for index in 0..<3 {
    let number = [arrayLikeTuple.0, arrayLikeTuple.1, arrayLikeTuple.2][index]
    print("Number at index \(index): \(number)")
}

let hour = 10

switch hour {
case 0...5:
    print("It's early morning.")
case 6...11:
    print("It's morning.")
case 12...17:
    print("It's afternoon.")
case 18...23:
    print("It's evening.")
default:
    print("Invalid hour.")
}


enum Direction {
    case north
    case south
    case east
    case west
}

let travelDirection = Direction.east

switch travelDirection {
case .north:
    print("Heading North")
case .south:
    print("Heading South!")
case .east:
    print("Heading East!")
case .west:
    print("Heading West!")
}


