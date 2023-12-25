import UIKit

var tanım = "baslayalim"

var sayi = 50
var sayi2 = 20.0
var sayi3 = 6.0
tanım.uppercased()
sayi.isMultiple(of: 5)
tanım.append("2")

var doublebölüm = sayi2/sayi3

print(doublebölüm)

var Number = 20
var Metin : String
var Tonumber : String = "metin"
Tonumber = String(Number)

Tonumber.append("20")


var ilkdizi = ["bardak",20,"tabak"] as [Any]
ilkdizi.append("A")
ilkdizi[1]
ilkdizi.count
ilkdizi[ilkdizi.count-1]
var tekrardizi = ilkdizi[2] as! String

tekrardizi.append("a")

var sayikümesi = [1,3,6,6,2]
sayikümesi.sort()
sayikümesi.first
print(sayikümesi)


var sayilarseti : Set = [2,2,2,3,3,4,6]
print(sayilarseti)

var setcevir = Set(sayikümesi)
print(setcevir)

var setbirlestirme = setcevir.union(sayilarseti)
print(setbirlestirme)

//key


var kaloriler = ["elma" : 30, "armut" : 20, "erık" :200]

kaloriler["elma"]

kaloriler.keys

kaloriler["elma"] = 400
kaloriler["elma"]

// while

var x=1

while x<8 {
    
    x += 1
    print(x)
}
// for

var fordizisi = [2,4,5,6,8,11,12,14]

for dizide in fordizisi{
    print(dizide)
}

for dönerek in 2...8{
    
    print(dönerek)
}


// if

var tanimif = 20


if (tanimif<20){
    print("olmaz")
    
}
else if (tanimif>20){
    print("olur")
}
else{
    print("hicbiri")
}
// fonksıyon

func fons (a : Int, b : Int){
    
    print(a+b)
}

fons(a: 20, b: 30)

 func fonkss(ab : Int, ac : Int) -> Int {
    return(ab+ac)
}
 
var funcs = fonkss(ab: 40, ac: 80)
print(funcs)


func lgcfunc(ad: Int, ag : Int)->Bool{
    if (ad>ag){
        
        return (false)
    }
    
    else { return(true)}
}

lgcfunc(ad: 20, ag: 30)

//opsiyoneller

var ismim : String?
ismim?.uppercased()
ismim = "ac"
ismim?.uppercased()

var ad = "adcac"

var sonucunu = Int(ad) ?? 1 * 8 // ad 7 gibi bir deger olsa sonuc 56 olacaktı string olunxa 8*1 oluyor
if let add = Int(ad) {
    add*4
}
