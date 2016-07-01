//
//  PostCell+CoreDataProperties.swift
//  Neighbourhood-coreData
//
//  Created by Prateek Mahawar on 01/07/16.
//  Copyright © 2016 Prateek Mahawar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PostCell {

    @NSManaged var postImage: NSData?
    @NSManaged var postTitle: String?
    @NSManaged var postDesc: String?

}
