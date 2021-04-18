import UIKit

/*
1. Описать несколько структур – любой легковой автомобиль и любой грузовик.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/

enum Type: CustomStringConvertible {
    case car, trunk
    
    var description: String {
        switch self {
        case .car:
            return "Легковой автомобиль"
        case .trunk:
            return "Грузовой автомобиль"
        }
    }
}

enum Engine: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
            case .on:
                return "Двигатель запущен"
            case .off:
                return "Двигатель заглушен"
        }
    }
}

enum Windows: CustomStringConvertible {
    case open, close
    
    var description: String {
        switch self {
        case .open:
            return "Окна опущены"
        case .close:
            return "Окна подняты"
        }
    }
}

enum Action {
    case switchEngine(Engine)
    case switchWindeows(Windows)
    case loadCargo(Double)
}

struct Auto {
    let type: Type
    let make: String
    let release: Int
    let trunkVolume: Double
    var engine: Engine = .off
    var windows: Windows = .close
    var filledTrunkVolume: Double = 0
    
    func descriptionCar() {
        print("Автомобиль \(make) \(release) года выпуска.\nОбъем багажника \(trunkVolume) литров.\n\(engine).\n\(windows).\nЗаполненный объем багажника: \(filledTrunkVolume) литров")
    }
    
    func descriptionTruck() {
        print("Автомобиль \(make) \(release) года выпуска.\nОбъем кузова \(trunkVolume) литров.\n\(engine).\n\(windows).\nЗаполненный объем кузова: \(filledTrunkVolume) литров")
    }
    
    init(type: Type, make: String, release: Int, trunkVolume: Double) {
        self.type = type
        self.make = make
        self.release = release
        self.trunkVolume = trunkVolume
    }
    
    mutating func perform(value: Action) {
        switch value {
        case .switchEngine(let status):
            engine = status
        case .switchWindeows(let status):
            windows = status
        case .loadCargo(let load):
            let expectedLoad = load + filledTrunkVolume
            switch expectedLoad {
            case _ where expectedLoad > trunkVolume:
                filledTrunkVolume = trunkVolume
            case _ where expectedLoad < 0:
                filledTrunkVolume = 0
            default:
                filledTrunkVolume += load
            }
        }
    }
}

var bmw = Auto(type: .car, make: "BMW X5", release: 2020, trunkVolume: 200)

bmw.engine = .on
bmw.windows = .open
bmw.filledTrunkVolume = 50

bmw.descriptionCar()
print("______\n")

bmw.perform(value: .switchWindeows(.close))
bmw.perform(value: .switchEngine(.off))
bmw.perform(value: .loadCargo(160))

bmw.descriptionCar()
print("______\n")

bmw.perform(value: .loadCargo(-210))

bmw.descriptionCar()
print("______\n")


var volvo = Auto(type: .trunk, make: "Volvo", release: 2019, trunkVolume: 3000)

volvo.engine = .on
volvo.windows = .open
volvo.filledTrunkVolume = 2500

volvo.descriptionTruck()
print("______\n")

volvo.perform(value: .switchWindeows(.close))
volvo.perform(value: .switchEngine(.off))
volvo.perform(value: .loadCargo(700))

volvo.descriptionTruck()
print("______\n")

volvo.perform(value: .loadCargo(-3200))

volvo.descriptionTruck()
print("______\n")







