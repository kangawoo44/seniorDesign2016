//
//  MasterMap+CoreDataProperties.swift
//  Map_Prototype
//
//  Created by Shared on 2/9/16.
//  Copyright © 2016 Shared. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MasterMap {

    @NSManaged var mapImage: NSData?
    @NSManaged var lights: NSSet?

}
