//
//  ListTableViewCell.swift
//  Shopping
//
//  Created by DANIEL CORNWELL on 2/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    weak var delegate: ListTableViewCellDelegate?
    
    var list: List? {
        didSet{
        updateView()
        }
    }
    
    
    private func updateView() {
        guard let list = list else { titleTextLabel.text = ""; return}
        titleTextLabel.text = list.title
        
        let image = list.isCompeted ? #imageLiteral(resourceName: "eggplant") : #imageLiteral(resourceName: "incomplete")
        isCompletedButton.setImage(image, for: .normal)
    }
    
    
    @IBAction func isCompletedButtonTapped(_ sender: Any) {
        delegate?.toggleButtonOnOff(sender: self)
    }


}



protocol ListTableViewCellDelegate: class {
    func toggleButtonOnOff(sender: ListTableViewCell)
}
