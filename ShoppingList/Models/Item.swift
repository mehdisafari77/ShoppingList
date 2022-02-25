//
//  Item.swift
//  ShoppingList
//
//  Created by Mehdi MMS on 25/02/2022.
//

import Foundation

class Item: Codable {
    var name: String
    var notes: String?
    var purchased: Bool
    
    init(name: String, notes: String?, purchased: Bool = false){
        self.name = name
        self.notes = notes
        self.purchased = purchased
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.notes == rhs.notes && lhs.purchased == rhs.purchased
    }
}
