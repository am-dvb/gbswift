import UIKit

print("Решить квадратное уравнение типа: ax^2 + bx + c = 0")

var x1:Double = 0
var x2:Double = 0
var discrim:Double = 0

let a:Double = 5
let b:Double = 9
let c:Double = 4

discrim = b * b - 4 * a * c
    print("Пусть а = \(Int(a)), b = \(Int(b)), а с = \(Int(c)).")
    print("Уравнение примет вид: \(Int(a))х^2 + \(Int(b))x + \(Int(c)) = 0")
    print("Найдём дискриминант квадратного уравнения по формуле: D = b2 − 4ac.")
    print("Мы получим значение: \(Int(b)) * \(Int(b)) - 4 * \(Int(a)) * \(Int(c)) = \(Int(discrim))")
if discrim > 0 {
    x1 = (-b + sqrt(discrim)) / (2 * a)
    x2 = (-b - sqrt(discrim)) / (2 * a)
    print("""
        
        Получаем 2 уравнения:
        Х1 = (-\(Int(b)) + D^2) / (2 * \(Int(a)))
        Х2 = (-\(Int(b)) - D^2) / (2 * \(Int(a)))
        
        """)
    print("И в результате получили: X1 = \(x1) и X2 = \(x2)")
} else if discrim == 0 {
    x1 = (-b + sqrt(discrim)) / (2 * a)
//    print("X1 = X2 = \(x1)")
} else {
    print("Дискриминант отрицательный, соответственно уравнение не имеет корней.")
}
