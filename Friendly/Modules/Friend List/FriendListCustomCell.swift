//
//  FriendListCustomCell.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import UIKit
import Kingfisher

final class FriendListCustomCell: UITableViewCell {
  @IBOutlet weak var photo: UIImageView!
  @IBOutlet weak var fullnameLabel: UILabel!
  
  func configure(_ fullname: String, _ image: String) {
    let imageURL = URL(string: image)
    
    photo.kf.setImage(with: imageURL)
    fullnameLabel.text = fullname
  }
}
