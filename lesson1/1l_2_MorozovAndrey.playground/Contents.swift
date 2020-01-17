import UIKit

print("""
    Даны катеты прямоугольного треугольника. Найти площадь, периметр и
    гипотенузу треугольника, если длина катета А равнятся 60см, а длина катета В = 70см.

    """)

    let cathetA = 60
    let cathetB = 70

    let area = cathetA * cathetB / 2
    let hypotenuseС = sqrt((Double)(cathetA * cathetA) + (Double)(cathetB * cathetB))
    let triangle = (Double)(cathetA + cathetB) + hypotenuseС

print("Площадь треугольника будет вычисляться по формуле: \(cathetA) * \(cathetB) /2 = \(area)см2")
print("Периметр треугольника будет вычисляться по формуле: \(cathetA) + \(cathetB) + \(Int(hypotenuseС)) ≈ \(Int(triangle))см")
print("Длина гипотенузы будет вычисляться по формуле: (\(cathetA) * \(cathetA) + \(cathetB) * \(cathetB))^2 ≈ \(Int(hypotenuseС))см")

