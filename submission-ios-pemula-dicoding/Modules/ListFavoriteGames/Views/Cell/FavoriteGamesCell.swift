//
//  FavoriteGamesCell.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 11/10/22.
//

import UIKit

class FavoriteGamesCell: UITableViewCell {
    
    
    @IBOutlet weak var imgFavGames: UIImageView!
    @IBOutlet weak var lblTitleFavGames: UILabel!
    @IBOutlet weak var lblRatingFavGames: UILabel!
    @IBOutlet weak var lblPlaytimeFavGames: UILabel!
    @IBOutlet weak var lblReleaseFavGames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
