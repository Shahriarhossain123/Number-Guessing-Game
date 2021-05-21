//
//  HintTitleTableViewCell.swift
//  Number Guessing Game
//
//  Created by Shishir_Mac on 4/15/21.
//

import UIKit

class HintTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var hintView: UIView!
    @IBOutlet weak var hinttitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hintView.backgroundColor = .white
        hintView.layer.cornerRadius = hintView.frame.height / 2;
        hintView.layer.borderWidth = 1
        hintView.layer.borderColor = Colors.violetColor.cgColor
        hintView.layer.shadowColor = Colors.violetColor.cgColor
        hintView.layer.shadowRadius = 4
        hintView.layer.masksToBounds = true;
        hinttitleLabel.textColor = Colors.violetColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
