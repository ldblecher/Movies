//
//  MovieViewCell.swift
//  MovieList
//
//  Created by Lee D Blecher on 6/1/15.
//  Copyright (c) 2015 Lee D Blecher. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {

    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
