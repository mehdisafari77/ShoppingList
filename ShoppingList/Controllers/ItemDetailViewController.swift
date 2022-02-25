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
        
        textViewDidBeginEditing(itemNotesLabel)
        textViewDidEndEditing(itemNotesLabel)
        
        itemNotesLabel.becomeFirstResponder()

        itemNotesLabel.selectedTextRange = itemNotesLabel.textRange(from: itemNotesLabel.beginningOfDocument, to: itemNotesLabel.beginningOfDocument)
        
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
        itemNotesLabel.layer.cornerRadius = 45.0
        itemNotesLabel.clipsToBounds = true
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if itemNotesLabel.textColor == UIColor.lightGray {
            itemNotesLabel.text = nil
            itemNotesLabel.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if itemNotesLabel.text.isEmpty {
            itemNotesLabel.text = "Add Notes..."
            itemNotesLabel.textColor = UIColor.lightGray
        }
    }
    
}
