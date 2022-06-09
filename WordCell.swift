//
//  WordCell.swift
//  Game_of_Words
//
//  Created by ПавелК on 30.01.2022.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        wordLabel.textColor = .white
        scoreLabel.textColor = .white
    }
    
    override func setSelected(_ selected: Bool = true, animated: Bool = true) {
    }
}
