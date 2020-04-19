//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

import UIKit

enum PaymentErrors: Error {
    
    case faceIdError   // Не сработал Face ID
    case insufficientFunds(underpayment: Int) // Не хватает денег на счету

}

struct Application {
    var price: Int
}

class AppStore {
    
    let faceIdWrong = false
    
    var balance = 0
    
    func action (app: Application) throws {
        
        guard faceIdWrong == false else {
            throw PaymentErrors.faceIdError
        }
        
        guard app.price < balance else {
            throw PaymentErrors.insufficientFunds(underpayment: app.price - balance)
        }
        
        balance = self.balance - app.price
        
        print("Покупка прошла успешно!")
        
    }
    
    func topUpBalance (sum: Int) {
        balance = self.balance + sum
        print("Баланс пополнен на \(sum) рублей.\nВаш остаток: \(balance) рублей.\n")
    }
}


let buy = AppStore()
buy.balance = 500

do {
    try buy.action(app: .init(price: 150))
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}

print("Остаток на карте: \(buy.balance) рублей.\n")

do {
    try buy.action(app: .init(price: 700))
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}


print("Остаток на карте: \(buy.balance) рублей.\n")

buy.topUpBalance(sum: 500)

do {
    try buy.action(app: .init(price: 700))
} catch PaymentErrors.faceIdError {
    print("Ваше лицо не распознано")
} catch PaymentErrors.insufficientFunds(let underpayment) {
    print("Для покупки не хватает \(underpayment) рублей. Пожалуйста, пополните баланс.")
}

print("Остаток на карте: \(buy.balance) рублей.\n")
