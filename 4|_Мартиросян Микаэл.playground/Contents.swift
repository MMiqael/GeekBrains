/*1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.*/


import UIKit

class Car {

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
        case open, closed
        
        var description: String {
            switch self {
            case .open:
                return "Окна опущены"
            case .closed:
                return "Окна подняты"
            }
        }
    }
    
    enum Headlights: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Фары включены"
            case .off:
                return "Фары выключены"
            }
        }
    }
    
    enum Transmission: CustomStringConvertible {
        case manual, automatic
        
        var description: String {
            switch self {
            case .manual:
                return "механическая"
            case .automatic:
                return "автоматическая"
            }
        }
    }
    
    enum SteeringWheel: CustomStringConvertible {
        case left, right
        
        var description: String {
            switch self {
            case .left:
                return "слева"
            case .right:
                return "справа"
            }
        }
    }
    
    enum EngineType: CustomStringConvertible {
        case gasoline, diesel, electric
        
        var description: String {
            switch self {
            case .gasoline:
                return "бензиновый"
            case .diesel:
                return "дизельный"
            case .electric:
                return "электрический"
            }
        }
    }
    
    enum Trailer: CustomStringConvertible {
        case hook, unhook
        
        var description: String {
            switch self {
            case .hook:
                return "Прицеп присоединен"
            case .unhook:
                return "Прицеп отсоединен"
            }
        }
    }
    
    enum SportMode: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Спортивный режим включен"
            case .off:
                return "Спортивный режим выключен"
            }
        }
    }
    
    enum Sunroof: CustomStringConvertible {
        case open, closed
        
        var description: String {
            switch self {
            case .open:
                return "Люк открыт"
            case .closed:
                return "Люк закрыт"
            }
        }
    }
    
    enum Action {
        case switchEngine(Engine)
        case switchWindows(Windows)
        case switchHeadlights(Headlights)
        case mileage(Double)
        case trailer(Trailer)
        case sportMode(SportMode)
        case sunroof(Sunroof)
    }
        
    var make: String
    var model: String
    var release: Int
    var color: String
    var mileage: Double = 0.0
    var transmission: Transmission
    var steeringWheel: SteeringWheel
    var engineType: EngineType
    var engine: Engine = .off
    var headLights: Headlights = .off
    var windows: Windows = .closed
    
    
    func description() {
        print("Автомобиль \(make) \(model) \(release) года выпуска.\nЦвет: \(color).\nПробег: \(mileage).\nКоробка передач: \(transmission).\nРасположение руля: \(steeringWheel).\nТип двигателя: \(engineType).\n\(engine).\n\(headLights).\n\(windows).")
    }
    
    init(make: String, model: String, release: Int, color: String, transmission: Transmission, steeringWheel: SteeringWheel, engineType: EngineType) {
        self.make = make
        self.model = model
        self.release = release
        self.color = color
        self.transmission = transmission
        self.steeringWheel = steeringWheel
        self.engineType = engineType
    }
    
    func command(action: Action){
    }
}

class TruckCar: Car {

    var trailer: Trailer
    var trunkVolume: Double
    var trunkColor: String
    
    func descriptionTruckCar() {
        print("Автомобиль \(make) \(model) \(release) года выпуска.\nЦвет: \(color).\nПробег: \(mileage).\nКоробка передач: \(transmission).\nРасположение руля: \(steeringWheel).\nТип двигателя: \(engineType).\n\(trailer).\nОбъем кузова: \(trunkVolume).\nЦвет кузова: \(trunkColor).\n\(engine).\n\(headLights).\n\(windows).")
    }

    init(make: String, model: String, release: Int, color: String, transmission: Transmission, steeringWheel: SteeringWheel, engineType: EngineType, trailer: Trailer, trunkVolume: Double, trunkColor: String) {
        self.trailer = trailer
        self.trunkVolume = trunkVolume
        self.trunkColor = trunkColor
        super.init(make: make, model: model, release: release, color: color, transmission: transmission, steeringWheel: steeringWheel, engineType: engineType)
    }
    
    override func command(action: Action) {
        switch action {
        case .switchEngine(let command):
            engine = command
        case .switchHeadlights(let command):
            headLights = command
        case .switchWindows(let command):
            windows = command
        case .mileage(let distance):
            mileage += distance
        case .trailer(let command):
            trailer = command
        default:
            break
        }
    }
}

class SportCar: Car {
    
    var sportMode: SportMode
    var sunroof: Sunroof
    
    func descriptionSportCar() {
          print("Автомобиль \(make) \(model) \(release) года выпуска.\nЦвет: \(color).\nПробег: \(mileage).\nКоробка передач: \(transmission).\nРасположение руля: \(steeringWheel).\nТип двигателя: \(engineType).\n\(engine).\n\(sportMode).\n\(sunroof).\n\(headLights).\n\(windows).")
      }
    
    init(make: String, model: String, release: Int, color: String, transmission: Transmission, steeringWheel: SteeringWheel, engineType: EngineType, sportMode: SportMode, sunroof: Sunroof) {
        self.sportMode = sportMode
        self.sunroof = sunroof
        super.init(make: make, model: model, release: release, color: color, transmission: transmission, steeringWheel: steeringWheel, engineType: engineType)
     }
     
     override func command(action: Action) {
         switch action {
         case .switchEngine(let command):
            engine = command
         case .switchHeadlights(let command):
            headLights = command
         case .switchWindows(let command):
            windows = command
         case .mileage(let distance):
            mileage += distance
         case .sportMode(let command):
            sportMode = command
         case .sunroof(let command):
            sunroof = command
         default:
             break
         }
     }
}

var scania = TruckCar(make: "Scania", model: "P-series", release: 2014, color: "красный", transmission: .automatic, steeringWheel: .left, engineType: .diesel, trailer: .hook, trunkVolume: 2000, trunkColor: "белый")
scania.descriptionTruckCar()
print("___________\n")

scania.command(action: .switchEngine(.on))
scania.command(action: .switchHeadlights(.on))
scania.command(action: .switchWindows(.open))
scania.command(action: .trailer(.unhook))
scania.command(action: .mileage(1500))
scania.command(action: .sportMode(.on)) //Проверка default
scania.descriptionTruckCar()
print("___________\n")

var ford = SportCar(make: "Ford", model: "Mustang", release: 2020, color: "желтый", transmission: .automatic, steeringWheel: .left, engineType: .gasoline, sportMode: .off, sunroof: .closed)
ford.descriptionSportCar()
print("___________\n")

ford.command(action: .switchEngine(.on))
ford.command(action: .switchHeadlights(.on))
ford.command(action: .switchWindows(.open))
ford.command(action: .mileage(200))
ford.command(action: .sportMode(.on))
ford.command(action: .sunroof(.open))
ford.command(action: .trailer(.hook)) //Проверка default
ford.descriptionSportCar()
print("___________\n")
