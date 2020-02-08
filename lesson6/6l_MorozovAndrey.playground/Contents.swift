import UIKit

protocol Calculatable{
    var weight: Double{get set}
}

protocol Weightable{
    func kitPrice() -> Double
}

class ShavingKit: Calculatable, Weightable{
    var weight: Double
    var razor: Double
    var foam: Double
    var lotion: Double
    
    init(weight: Double, razor: Double, foam: Double, lotion: Double) {
        self.weight = weight
        self.razor = razor
        self.foam = foam
        self.lotion = lotion
    }
    func kitPrice() -> Double{
        return razor + foam + lotion
    }
}
    
class ShoverKit: Calculatable, Weightable{
    var weight: Double
    var gel: Double
    var shampoo: Double
    var conditioner: Double
    var discount: Double
    
    func kitPrice() -> Double{
            return (gel + shampoo + conditioner) / discount
        }
    init(weight: Double, gel: Double, shampoo: Double, conditioner: Double, discount: Double) {
            self.weight = weight
            self.gel = gel
            self.shampoo = shampoo
            self.conditioner = conditioner
            self.discount = discount
        }
}

struct Store <T:Calculatable> {
    private var kits: [T] = []
    mutating func push(_ kit: T){
        kits.append(kit)
    }

    mutating func pop() -> T? {
        guard kits.count > 0 else {return nil}
        return kits.removeFirst()
    }

    func totalWeight() {
        guard kits.count > 0 else {return}
        var totalWeight: Double = 0.0
        kits.forEach {totalWeight += $0.weight}
        print("Total weight \(Store.self) is: ", totalWeight, "g." )
    }

    subscript(kits: Int...) -> Double {
        var weight: Double = 0.0
        
        for index in kits where index < self.kits.count {
            weight += self.kits[index].weight
        }
        return weight
        }
    subscript(kit: String) -> Int {
        return 0
    }
}
        
var shavingKit = Store<ShavingKit>()
var showerKit = Store<ShoverKit>()
var totalWeights = [0.0]
var totalPrice = [0.0]

shavingKit.push(ShavingKit(weight: 300, razor: 13.50, foam: 4.40, lotion: 2.80))
shavingKit.push(ShavingKit(weight: 200, razor: 11.30, foam: 3.99, lotion: 2.99))
shavingKit.push(ShavingKit(weight: 250, razor: 10.80, foam: 4.70, lotion: 2.70))
shavingKit.push(ShavingKit(weight: 350, razor: 15.50, foam: 4.80, lotion: 2.50))
shavingKit.push(ShavingKit(weight: 320, razor: 14.50, foam: 4.20, lotion: 2.90))
showerKit.push(ShoverKit(weight: 400, gel: 1.10, shampoo: 2.20, conditioner: 3.30, discount: 0.80))
showerKit.push(ShoverKit(weight: 300, gel: 1.10, shampoo: 2.20, conditioner: 3.30, discount: 0.80))
showerKit.push(ShoverKit(weight: 200, gel: 1.10, shampoo: 2.20, conditioner: 3.30, discount: 0.80))
showerKit.push(ShoverKit(weight: 100, gel: 1.10, shampoo: 2.20, conditioner: 3.30, discount: 0.80))
showerKit.push(ShoverKit(weight: 600, gel: 1.10, shampoo: 2.20, conditioner: 3.30, discount: 0.80))

shavingKit.totalWeight()
showerKit.totalWeight()

totalWeights.append(shavingKit[0])
totalWeights.append(shavingKit[1])
totalWeights.append(shavingKit[2])
totalWeights.append(shavingKit[3])
totalWeights.append(shavingKit[4])
totalWeights.append(showerKit[0])
totalWeights.append(showerKit[1])
totalWeights.append(showerKit[2])
totalWeights.append(showerKit[3])
totalWeights.append(showerKit[4])

print(totalWeights)
var fullWeight = totalWeights.reduce(0,+)
print("Total weight for all goods is: \(fullWeight) g.")
showerKit[0,1,4,8]

shavingKit.pop()
shavingKit.totalWeight()

