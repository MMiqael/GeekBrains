import UIKit

/*
1. Описать несколько структур – любой легковой автомобиль и любой грузовик.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/

enum Windows {
    case open, closed
}

enum Engine {
    case on, off
}

enum Trunk {
    case load, unload
}

enum Body {
    case load, unload
}

struct Car {
    let make: String
    let release: Int
    let trunkVolume: Int
    var engineOn: Bool = false
    var windowsOpen: Bool = false
    let filledTrunkVolume: Int
}

struct Truck {
    let make: String
    let release: Int
    let bodyVolume: Int
    var engineOn: Bool
    var windowsOpen: Bool
    let filledBodyVolume: Int
}

var bmw = Car(make: "BMW X6", release: 2000, trunkVolume: 15, engineOn: false, windowsOpen: true, filledTrunkVolume: 10)
var audi = Car(make: "Audi A6", release: 2005, trunkVolume: 25, engineOn: true, windowsOpen: false, filledTrunkVolume: 5)

var man = Car(make: "MAN", release: 2010, trunkVolume: 1000, engineOn: false, windowsOpen: false, filledTrunkVolume: 500)
var volvo = Car(make: "VOLVO", release: 2015, trunkVolume: 1500, engineOn: true, windowsOpen: true, filledTrunkVolume: 1000)

print(bmw)
print(audi)
print(man)
print(volvo)



