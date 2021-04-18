import UIKit

//Задание 1
//Решить квадратное уравнение.

//Уравнение: axˆ2 - bx + c = 0

var a: Float = 2
var b: Float = 9
var c: Float = 4

//Формула вычисления дискриминанта: D = bˆ2 - 4 * a * c

var d = pow(b, 2) - 4 * a * c

//Формула вычисления значений: x1,x2 = (-b +- sqrt(D)) / 2a

var xOne = (b + sqrt(d)) / 2 * a //переменная b со знаком плюс, так как в уравнении был задан минус
var xTwo = (b - sqrt(d)) / 2 * a

if xOne < xTwo {
    print(Int(xOne))
    print(Int(xTwo))
} else {
    print(Int(xTwo))
    print(Int(xOne))
}

//Задание 2.
//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var sideA: Float = 5
var sideB: Float = 10

var hypotenuse = sqrt(pow(a,2) + pow(b, 2))
var area = 1 / 2 * a * b
var perimeter = a + b + c

print(Int(hypotenuse))
print(Int(area))
print(Int(perimeter))

//Задание 3
//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

//Простые проценты

var sumOne: Float = 10000
var percentOne: Float = 10
var durationOne: Float = 5

sumOne = sumOne * (1 + percentOne/100)
let result = sumOne * durationOne
print(Int(result))


//Сложные проценты

var sumTwo: Float = 10000
var percentTwo: Float = 10
var durationOTwo: Float = 5

var i: Float = 0
var year: Float = 1
while i != durationOTwo {
    sumTwo = sumTwo * pow((1 + percentTwo/100), year)
    year += 1
    i += 1
}
print(Int(sumTwo))
