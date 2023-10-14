import UIKit

enum CarType {
    case Hatch, SUV, Sedan, Picape
}

protocol Car {
    var name: String { get }
    var model: CarType { get }
    var color: String { get }
    var speed: Double { get }
}
protocol PCD {
    var adapted: Bool { get set }
}

struct Mobi: Car, PCD {
    var name: String
    var model: CarType
    var color: String
    var speed: Double
    var adapted: Bool = false
}

let mobi = Mobi(name: "Mobi", model: .Hatch, color: "Black", speed: 152.2, adapted: false)
if mobi.adapted {
    print("É um carro adaptado.")
} else {
    print("Não é um carro adaptado.")
}
print("O \(mobi.name) é um ótimo carro, sua velocidade pode chegar a \(mobi.speed) Km/h.")

struct Pulse: Car, PCD {
    var name: String
    var model: CarType
    var color: String
    var speed: Double
    var adapted: Bool = true
}

let pulse = Pulse(name: "Pulse", model: .SUV, color: "Gray", speed: 189.0, adapted: true)
if pulse.adapted {
    print("É um carro adaptado.")
} else {
    print("Não é um carro adaptado.")
}
print("O \(pulse.name) é um ótimo carro, sua velocidade pode chegar a \(pulse.speed) Km/h.")

struct Cronos: Car, PCD {
    var name: String
    var model: CarType
    var color: String
    var speed: Double
    var adapted: Bool = true
    
    func isAdapte () {
        if adapted {
            print("É um carro adaptado.")
        } else {
            print("Não é um carro adaptado.")
        }
    }
}

let cronos = Cronos(name: "Cronos", model: .Sedan, color: "Black", speed: 183.5, adapted: true)
cronos.isAdapte()
print("O \(cronos.name) é um ótimo carro, sua velocidade pode chegar a \(cronos.speed) Km/h.")

struct Strada: Car, PCD {
    var name: String
    var model: CarType
    var color: String
    var speed: Double
    var adapted: Bool = false
}

let strada = Strada(name: "Strada", model: .Picape, color: "Red", speed: 183.0, adapted: false)
if strada.adapted {
    print("É um carro adaptado.")
} else {
    print("Não é um carro adaptado.")
}
print("O \(strada.name) é um ótimo carro, sua velocidade pode chegar a \(strada.speed) Km/h.")

var cars: [Car&PCD] = [mobi, pulse, cronos, strada]

var newCars = cars.map({ (car: Car&PCD) -> Car&PCD in
    var newCar = car
    if newCar.adapted == false {
        newCar.adapted = true
    }
    return newCar
})


for newCar in newCars {
    print("O carro \(newCar.name) agora está adaptado para PCD? \(newCar.adapted)")
}

DispatchQueue.global().sync {
    var counter = 5
    while true {
        print("Encerrando projeto em \(counter).")
        counter -= 1

        if counter == 0 {
            break
        }
    }
}
