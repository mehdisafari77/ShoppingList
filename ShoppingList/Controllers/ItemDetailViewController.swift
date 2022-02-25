//
//  ItemDetailViewController.swift
//  ShoppingList
//
//  Created by Mehdi MMS on 25/02/2022.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UITextField!
    @IBOutlet weak var itemNotesLabel: UITextView!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let name = itemNameLabel.text, !name.isEmpty else { return }
        
        if let item = item {
            ItemController.shared.updateShoppingItem(item: item, name: name, notes: itemNotesLabel.text)
        } else {
            ItemController.shared.createShoppingItem(name: name, notes: itemNotesLabel.text)
        }
        navigationController?.popViewController(animated: true)
    }

    func updateViews() {
        guard let item = item else { return }
        itemNameLabel.text = item.name
        itemNotesLabel.text = item.notes
    }

}
