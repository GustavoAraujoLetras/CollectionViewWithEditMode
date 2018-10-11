//
//  SongCell2.swift
//  CollectionViewWithEditMode
//
//  Created by Gustavo Araújo on 11/10/18.
//  Copyright © 2018 Letras. All rights reserved.
//

import Foundation
import UIKit

class SongCell: UITableViewCell {

    @IBOutlet private weak var songNameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!

    var song: Song? {
        didSet {
            songNameLabel.text = song?.name
            artistNameLabel.text = song?.artist
        }
    }

    override func prepareForReuse() {
        song = nil
        songNameLabel.text = nil
        artistNameLabel.text = nil
    }

}
