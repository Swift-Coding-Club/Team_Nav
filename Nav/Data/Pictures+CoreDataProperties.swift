//
//  Pictures+CoreDataProperties.swift
//  Nav
//
//  Created by 박재경 on 2023/07/01.
//
//

import Foundation
import CoreData


extension Pictures {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pictures> {
        return NSFetchRequest<Pictures>(entityName: "Pictures")
    }

    @NSManaged public var img: Data?
    @NSManaged public var relationship: PinInfo?

}
