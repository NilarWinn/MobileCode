//
//  PrioritizeCell.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

class PrioritizeCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var selectedData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedView.layer.cornerRadius = 7
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1
    }
}
