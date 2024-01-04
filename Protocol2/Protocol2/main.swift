
import Foundation

protocol Running {
    func MyRun()
    
    
}

class animal {
    
    func runnig(){
        print("koşuyor")
    }
}

class Dog : animal, Running {
    func MyRun() {
        print("yürüyor")
        
    }
    
    func hareket (){
        print("uçuyor")
    }
    
}

let isim = Dog()
isim.runnig()
isim.MyRun()
isim.hareket()


struct cat : Running{
    func MyRun(){
        
        print("kgkjg")
        
        
    }
}
    
var isim2 = cat()
  isim2.MyRun()
    


