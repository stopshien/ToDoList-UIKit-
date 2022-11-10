//
//  MyTableViewCell.swift
//  ToDoList(UIKit)
//
//  Created by 沈庭鋒 on 2022/11/4.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ToDoThings: UILabel!
    
    @IBOutlet weak var MyCheckButton: UIButton!{
        didSet {
                   MyCheckButton.configurationUpdateHandler = { button in
                       var config = button.configuration
                       config?.background.backgroundColor = button.isSelected ? .clear : .clear
//                       config?.attributedTitle?.foregroundColor = button.isSelected ? .systemBlue : .systemBlue
                       config?.image = button.isSelected ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
                       button.configuration = config
                   }
               }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func CheckButton(_ sender: Any) {
        
//        MyCheckButton.changesSelectionAsPrimaryAction = true
//        MyCheckButton.configurationUpdateHandler = { button in
//            var config = button.configuration
//            config?.image = UIImage(systemName: "\(button.isSelected ? "" : "checkmark." )circle")
//            button.configuration = config
//        }
        
    }
    
    
}
