//
//  BoardItemTableViewCell.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit
import MindDownloader

class BoardItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var boardImageView: UIImageView!
    
    @IBOutlet private weak var createdAtLabel: UILabel!
    func configureCell (boardCell: Board) {
        self.createdAtLabel.text = boardCell.createdAt ?? ""
        //loading image from mindDownloader Library
        if let imageUrl = URL(string: boardCell.urls?.regular ?? "") {
            self.boardImageView.loadImageFromUrl(url: imageUrl)
        }
    }
    
    
}
