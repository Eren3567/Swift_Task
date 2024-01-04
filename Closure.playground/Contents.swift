import UIKit

var greeting = "Hello, playground"

func sum (num1 : Int, num2 : Int)->Int{
    return num1 + num2
}
func calculate (num1: Int, num2: Int, myFunction : (Int,Int)->Int) -> Int{
    
    return myFunction(num1,num2)
    
}
 calculate(num1: 4, num2: 6, myFunction: sum)

print(calculate(num1: 4, num2: 6, myFunction: {$0*$1}))

let myArray = [10,20,30,40,50]

func test (num1 : Int)-> Int{
    return num1/5
}

print(myArray.map(test))
print(myArray.map({$0/5}))

