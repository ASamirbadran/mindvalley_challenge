//
//  BoardItemTableViewCell.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit

class BoardItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var boardImageView: UIImageView!
    
    @IBOutlet private weak var createdAtLabel: UILabel!
    func confiureCell (boardCell: Board) {
        self.createdAtLabel.text = boardCell.createdAt ?? ""
       
    }
    
    
}
