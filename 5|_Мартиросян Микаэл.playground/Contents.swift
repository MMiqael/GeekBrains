//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.


import UIKit

enum Engine: String {
    case on = "Двигатель запущен"
    case off = "Двигатель заглушен"
}

enum Windows: String {
    case open = "Окна опущены"
    case closed = "Окна подняты"
}

enum Headlights: String {
    case on = "Фары включены"
    case off = "Фары выключены"
}

enum Spoiler: String {
    case open = "Спойлер раскрыт"
    case closed = "Спойлер скрыт"
}

enum SportMode: String {
    case on = "Спортивный режим активирован"
    case off = "Спортивный режим отключен"
}

enum Trailer: String{
    case hook = "Прицеп присоединен"
    case unhook = "Прицеп отсоединен"
}

protocol Car {
    var make: String {get}
    var model: String {get}
    var release: Int {get}
    var engine: Engine {get set}
    var windows: Windows {get set}
    var headlights: Headlights {get set}
        
    mutating func switchEngine(action: Engine)
    mutating func switchWindows(action: Windows)
    mutating func switchHeadlights(action: Headlights)
}

extension Car {
    mutating func switchEngine(action: Engine) {
        switch action {
        case .on:
            self.engine = .on
            print(engine.rawValue)
        case .off:
            self.engine = .off
            print(engine.rawValue)
        }
    }
    
    mutating func switchWindows(action: Windows) {
        switch action {
        case .open:
            self.windows = .open
            print(windows.rawValue)
        case .closed:
            self.windows = .closed
            print(windows.rawValue)
        }
    }
    
    mutating func switchHeadlights(action: Headlights) {
        switch action {
        case .on:
            self.headlights = .on
            print(headlights.rawValue)
        case .off:
            self.headlights = .off
            print(headlights.rawValue)
        }
    }
}

class SportCar: Car {
    
    var make: String
    var model: String
    var release: Int
    var engine: Engine
    var windows: Windows
    var headlights: Headlights
    var spoiler: Spoiler
    var sportMode: SportMode
    
    init(make: String, model: String, release: Int){
        self.make = make
        self.model = model
        self.release = release
        self.engine = .off
        self.windows = .closed
        self.headlights = .off
        self.spoiler = .closed
        self.sportMode = .off
    }
    
    func switchSpoiler(action: Spoiler) {
        switch action {
        case .open:
            print("Спойлер раскрыт")
        case .closed:
            print("Спойлер скрыт")
        }
    }
    
    func switchSportMode(action: SportMode) {
        switch action {
        case .on:
            print("Спортивый режим активирован")
        case .off:
            print("Спортивный режим отключен")
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(make) \(model), \(release) года выпуска.\n\(engine.rawValue).\n\(windows.rawValue).\n\(headlights.rawValue).\n\(spoiler.rawValue).\n\(sportMode.rawValue)."
    }
}

class TrunkCar: Car {
    
    var make: String
    var model: String
    var release: Int
    var engine: Engine
    var windows: Windows
    var headlights: Headlights
    var trailer: Trailer
    
    init(make: String, model: String, release: Int){
        self.make = make
        self.model = model
        self.release = release
        self.engine = .off
        self.windows = .closed
        self.headlights = .off
        self.trailer = .unhook
    }
    
    func switchTrailer(action: Trailer) {
        switch action {
        case .hook:
            print("Прицеп присоединен")
        case .unhook:
            print("Прицеп отсоединен")
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(make) \(model), \(release) года выпуска.\n\(engine.rawValue).\n\(windows.rawValue).\n\(headlights.rawValue).\n\(trailer.rawValue)."
    }
}

var ferrari = SportCar(make: "Ferrari", model: "Enzo", release: 2005)
var scania = TrunkCar(make: "Scania", model: "P-series", release: 2010)

print(ferrari)
print("___________\n")

ferrari.switchEngine(action: .on)
ferrari.switchWindows(action: .open)
ferrari.switchHeadlights(action: .on)
ferrari.switchSpoiler(action: .open)
ferrari.switchSportMode(action: .on)
print("___________\n")


print(ferrari)
print("___________\n")


print(scania)
print("___________\n")

scania.switchEngine(action: .on)
scania.switchWindows(action: .open)
scania.switchHeadlights(action: .on)
scania.switchTrailer(action: .hook)

print("___________\n")
print(scania)

