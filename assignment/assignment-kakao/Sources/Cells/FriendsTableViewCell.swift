//
//  FriendsTableViewCell.swift
//  assignment-kakao
//
//  Created by 초이 on 2021/05/06.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(image: UIImage, name: String, message: String) {
        profileImageView.image = image
        nameLabel.text = name
        messageLabel.text = message
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
