//
//  ListSportCell.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 22/09/22.
//

import UIKit

class ListSportCell: UITableViewCell {
    
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var lblTitleGame: UILabel!
    @IBOutlet weak var lblReleaseGame: UILabel!
    @IBOutlet weak var lblPlayTime: UILabel!
    @IBOutlet weak var lblGenreGame: UILabel!
    @IBOutlet weak var lblRateGame: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
}
