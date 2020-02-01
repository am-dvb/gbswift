import UIKit

enum Type {
    case passengerCar, truck, sportcar
}
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

class PassengerCars {
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

    init(
        carID: String, type: Type, make: String, model: String, year: Int, fuelTankVolume: Int, filedTankVolume: Int, engineState: EngineState, windowsState: WindowsState
    ) {
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
    func printfiledTankVolume() {
        print(" And can be filled more: \(fuelTankVolume - filedTankVolume) l.")
    }
    func fillFuel(n: Int) {
        if fuelTankVolume < n + filedTankVolume {
            print("The maximum amount that you can fill the gas tank is \(fuelTankVolume - filedTankVolume) l.")
        } else {
            filedTankVolume = n + filedTankVolume
            print("Now the amount of fuel in the gas tank: \(filedTankVolume)")
        }
    }
    func printCar() {
        print("\(carID) is \(type): \(make), " +
                "model: \(model), year: \(year), " +
                "engine \(engineState), " +
                "windows \(windowsState), " +
                "fuel tank volume: \(fuelTankVolume) " +
                "l., fuel tank volume is filled to: \(filedTankVolume) l.",
            terminator: "")

        print(" And can be filled more: \(fuelTankVolume - filedTankVolume) l.", terminator: "")
    }

    class Trucks: PassengerCars {

        var payloadState: PayloadState
        init(carID: String, type: Type, make: String, model: String, year: Int, fuelTankVolume: Int, filedTankVolume: Int, engineState: EngineState, windowsState: WindowsState, payloadState: PayloadState) {
            self.payloadState = payloadState
            super.init(carID: carID, type: type, make: make, model: model, year: year, fuelTankVolume: fuelTankVolume, filedTankVolume: filedTankVolume, engineState: engineState, windowsState: windowsState)
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

        override func printCar() {
            print("Truck is \(self.payloadState).")
        }
    }

    class SportCars: PassengerCars {

        var chipTuningState: ChipTuningState
        init(carID: String, type: Type, make: String, model: String, year: Int, fuelTankVolume: Int, filedTankVolume: Int, engineState: EngineState, windowsState: WindowsState, chipTuningState: ChipTuningState) {
            self.chipTuningState = chipTuningState
            super.init(carID: carID, type: type, make: make, model: model, year: year, fuelTankVolume: fuelTankVolume, filedTankVolume: filedTankVolume, engineState: engineState, windowsState: windowsState)
        }

        override func printCar() {
            print("Sport car have chip-tuning: \(self.chipTuningState).")
        }

        func load() {
            chipTuningState = .yes
        }
        func unload() {
            chipTuningState = .no
        }
    }
}

let car1 = PassengerCars(carID: "car1", type: .passengerCar, make: "Toyota", model: "Prius", year: 2010, fuelTankVolume: 60, filedTankVolume: 30, engineState: .started, windowsState: .closed)
let car2 = PassengerCars(carID: "car2", type: .passengerCar, make: "Honda", model: "CRV", year: 2019, fuelTankVolume: 80, filedTankVolume: 10, engineState: .stopped, windowsState: .opened)
let car3 = PassengerCars(carID: "car3", type: .passengerCar, make: "Opel", model: "Corsa", year: 2017, fuelTankVolume: 50, filedTankVolume: 40, engineState: .started, windowsState: .opened)
let car4 = PassengerCars.Trucks(carID: "car4", type: .truck, make: "Mercedes", model: "800", year: 2011, fuelTankVolume: 200, filedTankVolume: 30, engineState: .stopped, windowsState: .opened, payloadState: .empty)
let car5 = PassengerCars.SportCars(carID: "car5", type: .sportcar, make: "Volvo", model: "F10", year: 2018, fuelTankVolume: 400, filedTankVolume: 100, engineState: .stopped, windowsState: .closed, chipTuningState: .yes)

let redcar = PassengerCars.init(
    carID: "redcar",
    type: .passengerCar,
    make: "Subaru",
    model: "Impreza",
    year: 2010,
    fuelTankVolume: 70,
    filedTankVolume: 20,
    engineState: .started,
    windowsState: .closed
)

car4.changeWindowsState()
car5.fillFuel(n: 31)
car4.changePayloadState()

car1.printCar()
car2.printCar()
car3.printCar()
car4.printCar()
car5.printCar()
redcar.printCar()











