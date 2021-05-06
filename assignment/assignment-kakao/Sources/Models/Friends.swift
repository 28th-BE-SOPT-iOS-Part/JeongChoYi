//
//  Friends.swift
//  assignment-kakao
//
//  Created by 초이 on 2021/05/06.
//

import UIKit

struct FriendDataModel {
    var image: UIImage
    var name : String
    var state: String
    
    init(imageName : String,
         name : String,
         state: String) {
        
        
        if let image = UIImage(named: imageName) {
            self.image = image
        } else {
            self.image = UIImage()
        }
        self.name = name
        self.state = state
    }
}
