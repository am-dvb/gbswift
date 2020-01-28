import UIKit

let number = 12

func checkOddEven() {
    if number % 2 == 0 {
        print("1. It is even number.")
    } else {
        print("1. It is odd number.")
    }
}

checkOddEven()


func devideThreeWoRem() {
    if number % 3 == 0 {
        print("\n2. This number is divisible by 3.")
    } else {
        print("\n2. This number is not divisible by 3.")
    }
}

devideThreeWoRem()


var array = [Int]()

for i in 1...100 {
    array.append(i)
}
print("\n3. Array of 100 numbers: \(array)")


var filteredNums = array.filter({$0 % 2 != 0 && $0 % 3 != 0})

print("\n4. Array without even numbers and numbers that are not divisible by 3: \(filteredNums)")


func fibonacci(_ number: Int) -> [Double] {
    var fibonacci = [Double]()
    
    for n in 0...number {
        if n == 0 {
            fibonacci.append(0)
        } else if n == 1 {
            fibonacci.append(1)
        } else {
            fibonacci.append(fibonacci[n - 1] + fibonacci[n - 2])
        }
    }
    return fibonacci
}

print("\n5.* Массив из первых 100 чисел Фибоначчи:", fibonacci(100))


func getPrimes(arrPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArray = arrPassed

    while let newPrime = newArray.first {
        primes.append(newPrime)
        newArray = newArray.filter { $0 % newPrime != 0 }
    }
    print("\n6.* Массив из первых 100 простых чисел: \(primes.prefix(100))")
    return primes
}

getPrimes(arrPassed: Array(2...1000))

