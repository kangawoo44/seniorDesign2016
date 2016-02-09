//
//  Lights+CoreDataProperties.swift
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

extension Lights {

    @NSManaged var lightID: String?
    @NSManaged var lightName: String?
    @NSManaged var isOnMap: Bool
    @NSManaged var xLocation: Int16
    @NSManaged var yLocation: Int16
    @NSManaged var rValue: NSDecimalNumber?
    @NSManaged var gValue: NSDecimalNumber?
    @NSManaged var bValue: NSDecimalNumber?
    @NSManaged var lightDes: String?
    @NSManaged var masterMap: MasterMap?
    @NSManaged var scenes: Scenes?

}
