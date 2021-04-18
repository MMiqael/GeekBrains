import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


struct Queue <T: Comparable> {
    var passengers: [T] = []
            
    mutating func entrance (value: T) {
        passengers.append(value)
    }
        
    mutating func exit() {
        passengers.removeFirst()
    }
        
    mutating func filter (value: T) {
        print("The passenger \(passengers.filter {$0 == value}) is listed")
    }
    
    subscript(index: Int) -> T? {
        return(index < passengers.count ? passengers[index] : nil)
    }
}

var pass = Queue<String>()

pass.entrance(value: "Андрей")
pass.entrance(value: "Владимир")
pass.entrance(value: "Никита")
print(pass)

pass.exit()
print(pass)

pass.entrance(value: "Александр")
pass.entrance(value: "Григорий")
print(pass)

pass.exit()
pass.exit()
print(pass)

pass.filter(value: "Григорий")
pass[0]
pass[2]

print("____________\n")

var passInt = Queue<Int>()

passInt.entrance(value: 10)
passInt.entrance(value: 20)
passInt.entrance(value: 30)
print(passInt)

passInt.exit()
print(passInt)

passInt.entrance(value: 40)
passInt.entrance(value: 50)
print(passInt)

passInt.exit()
passInt.exit()
print(passInt)

passInt.filter(value: 50)
passInt[0]
passInt[2]
