//
//  GameTableViewCell.swift
//  RefactorMVVM
//
//  Created by Guillermo Saavedra Dorantes on 22/01/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "GameTableViewCell"
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
