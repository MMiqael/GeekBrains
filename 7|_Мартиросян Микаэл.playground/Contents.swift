//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

import UIKit

enum PaymentErrors: Error {
    case doesNotExist // Нет приложения в App Store
    case faceIdError   // Не сработал Face ID
    case insufficientFunds(underpayment: Int) // Не хватает денег на счету
}

struct Application {
    var price: Int
}

class AppStore {
    
    var games = [
        "Minecraft": Application(price: 529),
        "GTA: San Andreas": Application(price: 529),
        "Monopoly": Application(price: 299),
        "GTA: Vice City": Application(price: 379),
        "Assasin's Creed": Application(price: 149)
    ]
    
    var faceIdWrong = false
    var balance = 0
    
    func action (game: String) throws {
        
        guard let name = games[game] else {
            throw PaymentErrors.doesNotExist
        }
        
        guard faceIdWrong == false else {
            throw PaymentErrors.faceIdError
        }
        
        guard name.price < balance else {
            throw PaymentErrors.insufficientFunds(underpayment: name.price - balance)
        }
        
        balance = self.balance - name.price
        
        print("Покупка \(game) прошла успешно!\nС карты списано: \(name.price) рублей.")
        
    }

    func topUpBalance (sum: Int) {
        balance = self.balance + sum
        print("Баланс пополнен на \(sum) рублей.\nВаш остаток: \(balance) рублей.\n")
    }
}


let buy = AppStore()
buy.topUpBalance(sum: 1000)

do {
    try buy.action(game: "GTA: San Andreas")
} catch PaymentErrors.doesNotExist {
    print("Приложения не существует.")
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}

print("Остаток на карте: \(buy.balance) рублей.\n")

do {
    try buy.action(game: "Minecraft")
} catch PaymentErrors.doesNotExist {
    print("Приложения не существует.")
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}


print("Остаток на карте: \(buy.balance) рублей.\n")

buy.topUpBalance(sum: 300)

do {
    try buy.action(game: "Monopoly")
} catch PaymentErrors.doesNotExist {
    print("Приложения не существует.")
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}

print("Остаток на карте: \(buy.balance) рублей.\n")

