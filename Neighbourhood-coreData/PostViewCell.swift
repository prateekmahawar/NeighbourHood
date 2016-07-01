//
//  PostViewCell.swift
//  Neighbourhood-coreData
//
//  Created by Prateek Mahawar on 01/07/16.
//  Copyright © 2016 Prateek Mahawar. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var PostDesc: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.width/2
        postImg.clipsToBounds = true
    }

    func configureCell(post:PostCell){
        postTitle.text = post.postTitle
        PostDesc.text = post.postDesc
        postImg.image = post.getImage()
    }
}
