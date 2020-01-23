//
//  HighScores+CoreDataProperties.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 19/01/2020.
//  Copyright © 2020 Jaypeeff. All rights reserved.
//
//

import Foundation
import CoreData


extension HighScores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HighScores> {
        return NSFetchRequest<HighScores>(entityName: "HighScores")
    }

    @NSManaged public var initials: String?
    @NSManaged public var score: Int16

}
