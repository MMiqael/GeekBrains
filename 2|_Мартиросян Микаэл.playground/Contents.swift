import UIKit

let randomNumbers = Int.random(in: 100...1000) //Генерируем случайное число

//Задание 1 - определяем, четное число или нет

func checkEven (value: Int) {
    (value % 2) > 0 ? print("\(value) нечетное число\n") : print("\(value) четное число\n")
}
checkEven(value: randomNumbers)

//Задание 2 - определяем, делится ли число без остатка на 3

func checkRemainder (value: Int) {
    (value % 3) > 0 ? print("\(value) не делится без остатка на 3\n") : print("\(value) делится без остатка на 3\n")
}
checkRemainder(value: randomNumbers)

//Задание 3 - создаем возрастающий массив из 100 чисел

var arrayNumbers: [Int] = []
for i in randomNumbers-99...randomNumbers {
    arrayNumbers.append(i)
}
print("\(arrayNumbers)\n")

//Задание 4 - удаляем из этого массива все четные числа и все числа, которые не делятся на 3

for value in arrayNumbers where ((value % 2) == 0 || (value % 3) != 0) {
    arrayNumbers.remove(at: arrayNumbers.firstIndex(of: value)!)
}
print("\(arrayNumbers)\n")
