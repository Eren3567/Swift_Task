import UIKit


class Odev1 {
    
    func maashesaplama(gunsayisi : Int) -> Int{
        let calismasaati = gunsayisi*8
        var maas = 0
        
        if calismasaati > 160 {
            
            let mesai  = calismasaati - 160
            maas = 160*10 + mesai*20
            
        }
        else{
            maas = calismasaati*10
            
        }
        return maas
        
    }
}

let o1 = Odev1()
let sonuc = o1.maashesaplama(gunsayisi: 22)
print("maas: \(sonuc) TL")

// Enum------------------------------------------------------------------
enum KonseveBoyut {
    
    case kücük
    case orta
    case büyük
}

func ucretAl(boyut: KonseveBoyut){
    switch boyut{
    case.kücük:
        print(20*10)
    case.orta:
        print(20*20)
    case.büyük:
        print(20*30)}
    
    
    }

var boyut = KonseveBoyut.orta

ucretAl(boyut: .orta)



//Composition------------------------------------------------------------
class kisiler {
    var ad : String?
    var yas : Int?
    var adres : Adres?
    
    init(ad: String, yas: Int, adres: Adres) {
        self.ad = ad
        self.yas = yas
        self.adres = adres
    }
}
    class Adres {
        var il : String?
        var ilce: String?
        init(il: String? = nil, ilce: String? = nil) {
            self.il = il
            self.ilce = ilce
        }
    }


let adrestanım = Adres(il: "il",ilce: "ilçe")
let kisitanım = kisiler(ad: "isim", yas: 30, adres: adrestanım)
print(kisitanım.adres!.il!)
//inheritance----------------------------------------
class Araba{
    
    var renk : String?
    var vites : String?
    
    init(renk: String, vites: String) {
        self.renk = renk
        self.vites = vites
    }
    
    
}

class Arac : Araba {
    var kasatipi : String?
    init(kasatipi: String, renk: String, vites: String) {
        self.kasatipi = kasatipi
        super.init(renk: renk,vites: vites)
    }
    
}

var araba = Arac(kasatipi: "düz",renk: "beyaz",vites: "düz1")
print(araba.kasatipi!)
// Override and Polymorphism-----------------------------------------------------------------
class Hayvan {
    
    func sesCikar (){
        print("ses yok")
    }
}
    class Memeli : Hayvan {
        
        override func sesCikar() {
            print("ses çıkmıyor")
            super.sesCikar()
        }
    }

class Kopek : Memeli {
    override func sesCikar() {
        print("ses var")
    }
}

var ses = Kopek()
ses.sesCikar()
var ses2 = Memeli()
ses2.sesCikar()
var hayvan : Hayvan = Kopek()
hayvan.sesCikar()
//polymorfism-------------------------
var araba1 : Araba = Arac(kasatipi: "düz2", renk: "beyaz2", vites: "düz3") as Araba


print(araba1.vites!)


class Personel{
    func iseAlindi(){
        print("personel ise girdi")
    }
}

class Mudur : Personel {
    func iseAl(p: Personel){
        p.iseAlindi()
    }}
    class Isci : Personel {
        
    }
    class Ogretmen: Personel {
        
    }
    
    var mudur = Mudur()
    
    var ogretmen : Personel = Ogretmen()
    var isci : Personel = Isci()
    mudur.iseAl(p: ogretmen)
ogretmen.iseAlindi()
// Extention-------------------------------------------------------------

extension Double {
    
    var km:Double {
        return self*1000.0}
    var m: Double {
        return self
    }
    var cm: Double{
        return self/100.0}
    
}
print(10.cm)

extension String {
    func yerdegistir(yeniharf: String,eskiharf:String)-> String{
        
        return self.replacingOccurrences(of: yeniharf, with: eskiharf)
    }
}

let str = "sehir".yerdegistir(yeniharf: "e", eskiharf: "a")

print(str)

// protokol-------------------------------------

protocol Protokol1 {
    
    var degisken : Int {get set }
    func metod1()
  
        func metod2()->String
      
    }

class ClassA : Protokol1{
    func metod2() -> String {
        return "protokol2"
    }
    
    func metod1() {
        print("protokol1")
    }
    
    var degisken = 12
    
}

var a = ClassA()
print(a.degisken)

protocol Sqeezable {
    func howToSqueezable()
     
    
}

protocol Eatable {
    func howToEatable()
      
}

class Aslan {
    
    
}

class Tavuk : Eatable{
    func howToEatable() {
        print("firinda olur")
    }
    

    }
    
    
class Elma : Eatable, Sqeezable{
    func howToEatable() {
        print("dilimle")
    }
    

    
    func howToSqueezable() {
        "suyunu çıkar"
    }
    
    
    
}

class FarklıElma : Elma{
    override func howToEatable() {
        print("yıkayarak ye")
    }
    
}

var aslan = Aslan()
var farklıelma2 : Elma = FarklıElma()
var elma = Elma()
var tavuk : Eatable = Tavuk()


var nesneler = [aslan,elma,farklıelma2,tavuk] as [Any]

for nesne in nesneler {
    
    
    if nesne is Eatable{
        (nesne as!  Eatable).howToEatable()
    }
    if nesne is Sqeezable{
        (nesne as! Sqeezable).howToSqueezable()
    }
}

//closure---------------------------------

let ifade = {
    print("closure yap")
}
ifade()

let topla = {
    
    (sayi1: Int, sayi2: Int) -> Int in
    return sayi1 + sayi2
}

let sonuc2 = topla(20,30)

print(sonuc2)

let sayilar :[Int] = [4,8,-12,2,-6]

let siralama1 = sayilar.sorted(by: {sayi1,sayi2 in sayi1>sayi2})
print(siralama1)

let siralama2 = sayilar.sorted( by: {$0<$1})

print(siralama2)

let siralama3 = sayilar.sorted(by: >)
print(siralama3)

// aray application

class Ogrenci{
    var adi : String?
    var yas : Int?
    
    init(adi: String? = nil, yas: Int? = nil) {
        self.adi = adi
        self.yas = yas
    }
}

var og1 = Ogrenci(adi: "isim", yas: 30)
var og2 = Ogrenci(adi: "isim2", yas: 32)

var Liste = [Ogrenci]()

Liste += [og1,og2]
for ogrenciler in Liste{
    print("\(ogrenciler.adi!)-\(ogrenciler.yas!)")
  
    
}

//for siralamadongusu in Liste{
    
  //  print(siralamadongusu.adi)
//}
//let siralama4 = Liste.sorted(by: {$0.yas!>$1.yas!})
//print(siralama4)


// String metod-------------
var str1 = "String"
if str1.contains("i"){
    print("içeir")
}
else   {
    print("içermez")
}

str1.insert("a", at: str1.index(str1.startIndex, offsetBy: 3))
print(str1)
str1.remove(at: str1.index(str1.startIndex, offsetBy: 2))
print(str1)

//Guard Kullanımı ------------------------------------------------------

func KisiTanimi(ad:String){
    guard ad == "isim" else {
        print("tanınmayan")
        return
        
        
    }
    print("evet isim")
}

// do try catch

enum Hatalar : Error {
    case sifiraBolumezHatas
}

func bolme (s1: Int, s2 : Int) throws-> Int{
    if s2 == 0{
        throw Hatalar.sifiraBolumezHatas
    }
    
    return s1/s2
}

var s1 = 10
var s2 = 0

do {
    let sonuc = try bolme(s1: s1, s2: s2)
}

catch Hatalar.sifiraBolumezHatas{
    print("sifira bölünemez")
}
// Dispatch queu Thread-----------------------------------------------------------
let queu = DispatchQueue(label: "etiket",qos: DispatchQoS.background)
let queu2 = DispatchQueue(label: "etiket2",qos: DispatchQoS.userInitiated)
queu.async {
    for b in 1...12{
        print(b)
        
    }
}
queu2.async {
    for b in 21...30{
        print(b)
    }
}

enum HavaDurumu {
    case gunesli
    case yagmurlu
    case bulutlu
}

var bugun = HavaDurumu.gunesli
var yarın = HavaDurumu.yagmurlu
switch yarın {
case .gunesli:
    print("Bugün hava güneşli.")
case .yagmurlu:
    print("Bugün hava yağmurlu.")
case .bulutlu:
    print("Bugün hava bulutlu.")
}


protocol YemekDelegate {
    var hiz: Int { get set }  // Hem okuyabilir hem yazabilir
    func yemekYap()
}

class Asci: YemekDelegate {
    var hiz: Int = 0
    
    func yemekYap() {
        print("Aşçı yemek yapıyor.")
    }
}

class Mutfak {
    var delegate: YemekDelegate?
    
    func yemekPisir() {
        delegate?.yemekYap()
    }
}

let asci = Asci()
let mutfak = Mutfak()

mutfak.delegate = asci
mutfak.yemekPisir()  // Çıktı: Aşçı yemek yapıyor.
