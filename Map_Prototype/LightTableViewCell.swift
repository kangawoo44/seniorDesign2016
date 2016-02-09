//
//  LightTableViewCell.swift
//  Map_Prototype
//
//  Created by Shared on 2/8/16.
//  Copyright © 2016 Shared. All rights reserved.
//

import UIKit

//typealias ToDoCellDidTapButtonHandler = () -> Void

class LightTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    //var didTapButtonHandler: ToDoCellDidTapButtonHandler?
    
    // MARK: -
    // MARK: Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //setupView()
    }
/*
    
    // MARK: -
    // MARK: Actions
    func didTapButton(sender: AnyObject) {
        if let handler = didTapButtonHandler {
            handler()
        }
    }   */
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
