import UIKit

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let depositAmount:Double = 1000
let percentOnDeposit:Double = 9
let growth:Double = 1 + (percentOnDeposit/100)
var periodOfYears:Double = 5
var depositAmountInYears:Double = depositAmount

while periodOfYears > 0 {
    depositAmountInYears = depositAmountInYears*growth
    periodOfYears -= 1
}

print("При сумме вклада 1000 руб. и годовой процентной ставке 9% сумма вклада через 5 лет составит \(Int(depositAmountInYears)) руб.")
    

