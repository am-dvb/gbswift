import UIKit

enum Type {
    case passengerCar, truck
}
enum WindowsState {
    case opened, closed
}
enum EngineState {
    case started, stopped
}

struct PassengerCars {
    let type: Type
    let carID: String
    let make: String
    let model: String
    let year: Int
    var fuelTankVolume: Int
    var filedTankVolume: Int
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
            print("Engine state was changed from \(oldValue) to \(self.windowsState)")
        }
        willSet {
            print("Engine state will be changed from \(self.windowsState) to \(newValue)")
        }
    }

    init(carID: String, type: Type, make: String, model: String, year: Int, fuelTankVolume: Int, filedTankVolume: Int, engineState: EngineState, windowsState: WindowsState) {
        self.type = type
        self.carID = carID
        self.make = make
        self.model = model
        self.year = year
        self.fuelTankVolume = fuelTankVolume
        self.filedTankVolume = filedTankVolume
        self.engineState = engineState
        self.windowsState = windowsState
    }

    mutating func changeWindowsState() {
        if windowsState == .closed {
            windowsState = .opened
        } else {
            windowsState = .closed
        }
    }
    mutating func changeEngineState() {
        if engineState == .stopped {
            engineState = .started
        } else {
            engineState = .stopped
        }
    }
    func printfiledTankVolume() {
        print(" And can be filled more: \(fuelTankVolume - filedTankVolume) l.")
    }
    func fillFuel(n: Int) {
        if car1.fuelTankVolume < n + car1.filedTankVolume  {
                print("The maximum amount that you can fill the gas tank is \(car1.fuelTankVolume - car1.filedTankVolume) l.")
        } else {
            car1.filedTankVolume = n + car1.filedTankVolume
                print("Now the amount of fuel in the gas tank: \(car1.filedTankVolume)")
        }
    }
    func printCar() {
        print("\(carID) is \(type): \(make), model: \(model), year: \(year), engine \(engineState), windows \(windowsState), fuel tank volume: \(fuelTankVolume) l., fuel tank volume is filled to: \(filedTankVolume) l.", terminator: "")
        print(" And can be filled more: \(fuelTankVolume - filedTankVolume) l.")
    }
}

struct Trucks {
    let type: Type
    let carID: String
    let make: String
    let model: String
    let year: Int
    let fuelTankVolume: Int
    var filedTankVolume: Int
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
    
    init(carID: String, type: Type, make: String, model: String, year: Int, fuelTankVolume: Int, filedTankVolume: Int, engineState: EngineState, windowsState: WindowsState) {
        self.type = type
        self.carID = carID
        self.make = make
        self.model = model
        self.year = year
        self.fuelTankVolume = fuelTankVolume
        self.filedTankVolume = filedTankVolume
        self.engineState = engineState
        self.windowsState = windowsState
    }

    mutating func changeWindowsState() {
        if windowsState == .closed {
            windowsState = .opened
        } else {
            windowsState = .closed
    }
}
    mutating func changeEngineState() {
        if engineState == .stopped {
            engineState = .started
        } else {
            engineState = .stopped
        }
    }
    func printfiledTankVolume() {
        print(" and can be filled more: \(fuelTankVolume - filedTankVolume) l.")
}
    func fillFuel(n: Int) {
        if car1.fuelTankVolume < n + car1.filedTankVolume  {
                print("The maximum amount that you can fill the gas tank is \(car1.fuelTankVolume - car1.filedTankVolume) l.")
        } else {
            car1.filedTankVolume = n + car1.filedTankVolume
                print("Now the amount of fuel in the gas tank: \(car1.filedTankVolume)")
        }
    }
    func printCar() {
        print("\(carID) is \(type): \(make), model: \(model), year: \(year), engine \(engineState), windows \(windowsState), fuel tank volume: \(fuelTankVolume) l., fuel tank volume is filled to: \(filedTankVolume) l.", terminator: "")
        print(" And can be filled more: \(fuelTankVolume - filedTankVolume) l.")
    }
}

var car1 = PassengerCars(carID: "car1", type: .passengerCar, make: "Toyota", model: "Prius", year: 2010, fuelTankVolume: 60, filedTankVolume: 30, engineState: .started, windowsState: .closed)
var car2 = PassengerCars(carID: "car2", type: .passengerCar, make: "Honda", model: "CRV", year: 2019, fuelTankVolume: 80, filedTankVolume: 10, engineState: .stopped, windowsState: .opened)
var car3 = PassengerCars(carID: "car3", type: .passengerCar, make: "Opel", model: "Corsa", year: 2017, fuelTankVolume: 50, filedTankVolume: 40, engineState: .started, windowsState: .opened)
var car4 = Trucks(carID: "car4", type: .truck, make: "Mercedes", model: "800", year: 2011, fuelTankVolume: 200, filedTankVolume: 30, engineState: .stopped, windowsState: .opened)
var car5 = Trucks(carID: "car5", type: .truck, make: "Volvo", model: "F10", year: 2018, fuelTankVolume: 400, filedTankVolume: 100, engineState: .stopped, windowsState: .closed)
var redcar = PassengerCars.init(carID: "redcar", type: .passengerCar, make: "Subaru", model: "Impreza", year: 2010, fuelTankVolume: 70, filedTankVolume: 20, engineState: .started, windowsState: .closed)

car4.changeWindowsState()
    
car5.fillFuel(n: 31)

car1.printCar()
car2.printCar()
car3.printCar()
car4.printCar()
car5.printCar()
redcar.printCar()

		

