import UIKit

struct SchoolItens {
    var price: Double
    var amount: Int
}

enum Itens {
    case notebook
    case pencil
    case pencilCase
    case pen
    case bag
}

struct Client {
    var name: String
    var money: Double
    var listBuy: [Itens: SchoolItens]
}

var joao = Client(name: "João", money: 30.0, listBuy: [Itens.notebook: SchoolItens(price: 0, amount: 10)])
var maria = Client(name: "Maria", money: 40.0, listBuy: [Itens.notebook: SchoolItens(price: 0, amount: 50)])
var jose = Client(name: "José", money: 60.0, listBuy: [Itens.pencil: SchoolItens(price: 0, amount: 30)])
var creusa = Client(name: "Creusa", money: 150.0, listBuy: [Itens.pen: SchoolItens(price: 0, amount: 10)])

class SchoolList {
    var inventory = [
        Itens.notebook: SchoolItens(price: 15.0, amount: 20),
        Itens.pencil: SchoolItens(price: 2.00, amount: 40),
        Itens.pencilCase: SchoolItens(price: 6.50, amount: 20),
        Itens.pen: SchoolItens(price: 2.50, amount: 40),
        Itens.bag: SchoolItens(price: 20.50, amount: 10)
    ]
    func leave(_ client: Client) {
        for item in inventory {
            if item.key == client.listBuy.first?.key {
                let clientItem = client.listBuy.first
                
                if clientItem?.value.amount ?? 0 <= item.value.amount {
                    var buyValue = Double(clientItem?.value.amount ?? 0) * item.value.price
                    if client.money >= buyValue {
                        var vend = item.value.amount - (clientItem?.value.amount ?? 0)
                        inventory.updateValue(SchoolItens(price: 0, amount: vend), forKey: item.key)
                        print("Cliente \(client.name), compra realizada com sucesso.")
                    } else {
                        print("Cliente \(client.name), saldo insuficiente para a compra.")
                    }
                    
                } else {
                    print("Cliente \(client.name), quantidade de itens indisponível.")
                }
            }
        }
    }
}
var schoolList = SchoolList()
DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    schoolList.leave(joao)
    schoolList.leave(maria)
    schoolList.leave(jose)
}

DispatchQueue.main.async {
    print("Oi, sou \(creusa.name) estou doente, tive que furar a fila.")
    schoolList.leave(creusa)
}

let creusaListAmount = creusa.listBuy.map({ list in 2 * list.value.amount })
print(creusaListAmount)

