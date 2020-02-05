import UIKit

enum WindowsState {
    case opened, closed
}
enum EngineState {
    case started, stopped
}
enum PayloadState {
    case loaded, empty
}
enum ChipTuningState {
    case yes, no
}

protocol Car: class {
    var carID: String { get }
    var make: String { get }
    var model: String { get }
    var year: Int { get }
    var fuelTankVolume: Int { get set }
    var filledTankVolume: Int { get set }

    func amountFuel() -> Int
}
extension Car {
    func printfiledTankVolume() {
        print("And can be filled more: \(fuelTankVolume - filledTankVolume) l.")
    }
    func fillFuel(n: Int) {
        if fuelTankVolume < n + filledTankVolume {
            print("Sorry, you can't fill the tank, because of maximum amount that you can fill the tank is \(fuelTankVolume - filledTankVolume) l.")
        } else {
            filledTankVolume = n + filledTankVolume
            print("Now the amount of fuel in the gas tank: \(filledTankVolume)")
        }
    }
}

class SportCar: Car {
    var carID: String
    var make: String
    var model: String
    var year: Int
    var fuelTankVolume: Int
    var filledTankVolume: Int
    var chipTuningState: ChipTuningState
    var engineState: EngineState = .stopped {
        didSet {
            print("Engine state was changed from \(oldValue) to \(self.engineState)")
        }
        willSet {
            print("Engine state will be changed from \(self.engineState) to \(newValue)")
        }
    }
    var windowsState: WindowsState = .closed {
        didSet {
            print("Windows state was changed from \(oldValue) to \(self.windowsState)")
        }
        willSet {
            print("Windows state will be changed from \(self.windowsState) to \(newValue)")
        }
    }

    init(
        carID: String, make: String, model: String, year: Int, fuelTankVolume: Int, filledTankVolume: Int, chipTuningState: ChipTuningState, engineState: EngineState, windowsState: WindowsState
    ) {
        self.carID = carID
        self.make = make
        self.model = model
        self.year = year
        self.fuelTankVolume = fuelTankVolume
        self.filledTankVolume = filledTankVolume
        self.chipTuningState = chipTuningState
        self.engineState = engineState
        self.windowsState = windowsState
    }

    func changeWindowsState() {
        if windowsState == .closed {
            windowsState = .opened
        } else {
            windowsState = .closed
        }
    }
    func changeEngineState() {
        if engineState == .stopped {
            engineState = .started
        } else {
            engineState = .stopped
        }
    }
    func printChipTuning() {
        print("Sport car have chip-tuning: \(self.chipTuningState).")
    }
    func chipTuningYes() {
        chipTuningState = .yes
    }
    func chipTuningNo() {
        chipTuningState = .no
    }
    func amountFuel() -> Int {
        return filledTankVolume
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(carID) is: \(make), model: \(model), year of production: \(year), have fuel tank volume: \(fuelTankVolume) l., which is filled with \(filledTankVolume) liters."
    }
}

class Truck: Car {
    var carID: String
    var make: String
    var model: String
    var year: Int
    var fuelTankVolume: Int
    var filledTankVolume: Int
    var payloadState: PayloadState
    var engineState: EngineState = .stopped {
        didSet {
            print("Engine state was changed from \(oldValue) to \(self.engineState)")
        }
        willSet {
            print("Engine state will be changed from \(self.engineState) to \(newValue)")
        }
    }
    var windowsState: WindowsState = .closed {
        didSet {
            print("Windows state was changed from \(oldValue) to \(self.windowsState)")
        }
        willSet {
            print("Windows state will be changed from \(self.windowsState) to \(newValue)")
        }
    }

    init(
        carID: String, make: String, model: String, year: Int, fuelTankVolume: Int, filledTankVolume: Int, payloadState: PayloadState, engineState: EngineState, windowsState: WindowsState
    ) {
        self.carID = carID
        self.make = make
        self.model = model
        self.year = year
        self.fuelTankVolume = fuelTankVolume
        self.filledTankVolume = filledTankVolume
        self.payloadState = payloadState
        self.engineState = engineState
        self.windowsState = windowsState
    }

    func changeWindowsState() {
        if windowsState == .closed {
            windowsState = .opened
        } else {
            windowsState = .closed
        }
    }
    func changeEngineState() {
        if engineState == .stopped {
            engineState = .started
        } else {
            engineState = .stopped
        }
    }
    func load() {
        payloadState = .loaded
    }
    func unload() {
        payloadState = .empty
    }
    func changePayloadState() {
        if payloadState == .empty {
            payloadState = .loaded
        } else {
            payloadState = .empty
        }
    }
    func printTruckLoad() {
        print("Truck is \(self.payloadState).")
    }
    func amountFuel() -> Int {
        return filledTankVolume
    }
}
extension Truck: CustomStringConvertible {
    var description: String {
        return "\(carID) is: \(make), model: \(model), year of production: \(year), have fuel tank volume: \(fuelTankVolume) l., which is filled with \(filledTankVolume) liters."
    }
}

let car1 = SportCar(carID: "Car1", make: "Mazda", model: "RX8", year: 2012, fuelTankVolume: 55, filledTankVolume: 30, chipTuningState: .yes, engineState: .stopped, windowsState: .closed)
let car2 = SportCar(carID: "Car2", make: "Honda", model: "Prelude", year: 2002, fuelTankVolume: 75, filledTankVolume: 40, chipTuningState: .no, engineState: .started, windowsState: .opened)
let car3 = SportCar(carID: "Car3", make: "Subaru", model: "Impreza", year: 2019, fuelTankVolume: 65, filledTankVolume: 60, chipTuningState: .yes, engineState: .stopped, windowsState: .closed)
let car4 = Truck(carID: "Car4", make: "Mercedes", model: "800", year: 2011, fuelTankVolume: 155, filledTankVolume: 70, payloadState: .empty, engineState: .stopped, windowsState: .closed)
let car5 = Truck(carID: "Car5", make: "Volvo", model: "F10", year: 2012, fuelTankVolume: 255, filledTankVolume: 130, payloadState: .loaded, engineState: .stopped, windowsState: .closed)

car1.changeWindowsState()
car2.changeEngineState()
car3.fillFuel(n: 40)
car4.fillFuel(n: 30)
car4.changePayloadState()

print(car1, terminator: " ")
car1.printfiledTankVolume()
print(car2, terminator: " ")
car2.printfiledTankVolume()
print(car3, terminator: " ")
car3.printfiledTankVolume()
print(car4, terminator: " ")
car4.printfiledTankVolume()
print(car5, terminator: " ")
car5.printfiledTankVolume()
