//
//  PostCell.swift
//  Neighbourhood-coreData
//
//  Created by Prateek Mahawar on 01/07/16.
//  Copyright © 2016 Prateek Mahawar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PostCell: NSManagedObject {

    func setImage(img:UIImage){
        let data = UIImagePNGRepresentation(img)
        self.postImage = data
    }
    func getImage() -> UIImage{
        let img = UIImage(data: self.postImage!)!
        return img
    }
}
