//
//  Order.swift
//  DonutShop
//
//  Created by Allan Auezkhan on 17.05.2026.
//

import Foundation


struct OrderData: Codable {
    var type: Int
    var quantity: Int
    var specialRequestEnabled: Bool
    var extraFrosting: Bool
    var addSprinkles: Bool
    var name: String
    var streetAddress: String
    var city: String
    var zip: String
}


@Observable
class Order {
    static let types = ["Glazed", "Strawberry", "Chocolate", "Oreo"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }

    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2

        if extraFrosting {
            cost += Decimal(quantity)
        }

        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
}
