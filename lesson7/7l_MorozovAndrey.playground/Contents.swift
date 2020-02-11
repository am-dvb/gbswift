import UIKit

enum InsuranceErrors: Error {
    case startDateIncorrect
    case periodInsIncorrect
    case moneyOnlyForPeriod
    case countryNotCovered
}

struct Countries {
    let name: String
}

struct GreenCard {
    let countries: Countries
    var price: Int
    let period: Int
    var count: Int
    let startDate = Date()
    let countriesCover: String
}

class Insurance {
    let availableMoney = 22
    let todayZDate = Date(timeIntervalSinceNow: 24 * 60 * 60)
    var totalAmount = 0
    var desiredCountries = "AllEU"
    var insuranceInStock = [
        "AllEU, 3 months": GreenCard(countries: Countries(name: "AllEU"), price: 10, period: 3, count: 0, countriesCover: "AllEU"),
        "AllEU, 6 months": GreenCard(countries: Countries(name: "AllEU"), price: 16, period: 6, count: 0, countriesCover: "AllEU"),
        "AllEU, 9 months": GreenCard(countries: Countries(name: "AllEU"), price: 20, period: 9, count: 0, countriesCover: "AllEU"),
        "AllEU, 12 months": GreenCard(countries: Countries(name: "AllEU"), price: 22, period: 12, count: 0, countriesCover: "AllEU"),
        "BY+MD+UA, 3 months": GreenCard(countries: Countries(name: "BY+MD+UA"), price: 6, period: 3, count: 0, countriesCover: "BY+MD+UA"),
        "BY+MD+UA, 6 months": GreenCard(countries: Countries(name: "BY+MD+UA"), price: 10, period: 6, count: 0, countriesCover: "BY+MD+UA"),
        "BY+MD+UA, 9 months": GreenCard(countries: Countries(name: "BY+MD+UA"), price: 14, period: 9, count: 0, countriesCover: "BY+MD+UA"),
        "BY+MD+UA, 12 months": GreenCard(countries: Countries(name: "BY+MD+UA"), price: 16, period: 12, count: 0, countriesCover: "BY+MD+UA")
    ]

    func buyInsurance(name: String) throws {
        guard var insur = insuranceInStock[name] else { throw InsuranceErrors.periodInsIncorrect }
        guard (insur.price) < availableMoney else { throw InsuranceErrors.moneyOnlyForPeriod }
        guard insur.startDate < todayZDate as Date else { throw InsuranceErrors.startDateIncorrect }
        guard insur.countriesCover != desiredCountries else { throw InsuranceErrors.countryNotCovered }

        totalAmount += insur.price
        insur.count += 1
        insuranceInStock[name] = insur
        print("The total amount of sales is: \(totalAmount)")
    }
}

let insurance = Insurance()
try? insurance.buyInsurance(name: "AllEU, 1 month")
try? insurance.buyInsurance(name: "AllEU, 3 months")
try? insurance.buyInsurance(name: "BY+MD+UA, 9 months")
try? insurance.buyInsurance(name: "BY+MD+UA, 12 months")

insurance.totalAmount
insurance.insuranceInStock

do {
    try insurance.buyInsurance(name: "AllEU, 3 months")
} catch InsuranceErrors.countryNotCovered {
    print("The country you selected cannot be covered.")
} catch InsuranceErrors.moneyOnlyForPeriod {
    print("Your money is not enough for this insuranse.")
} catch InsuranceErrors.periodInsIncorrect {
    print("We do not have insurance for the time period you selected.")
} catch InsuranceErrors.startDateIncorrect {
    print("The date you selected is incorrect.")
} catch {
    print("Unknown error.")
}
