//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Mehdi MMS on 25/02/2022.
//

import UIKit

protocol ItemCompletionDelegate: AnyObject {
    func itemCheckboxTapped(_ sender: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var checkboxLabel: UIButton!
    
    var item: Item? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ItemCompletionDelegate?
    
    @IBAction func checkboxTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.itemCheckboxTapped(self)
        }
    }
    
    func updateViews() {
        
        guard let item = item else { return }
        itemNameLabel.text = item.name
        let checked = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default))
        let unchecked = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default))
                                
        if item.purchased {
            checkboxLabel.setBackgroundImage(checked, for: .normal)
        } else {
            checkboxLabel.setBackgroundImage(unchecked, for: .normal)
        }
        
        
    }
}
