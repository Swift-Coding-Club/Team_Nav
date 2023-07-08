//
//  Theme+CoreDataProperties.swift
//  Nav
//
//  Created by 박재경 on 2023/07/01.
//
//

import Foundation
import CoreData


extension Theme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Theme> {
        return NSFetchRequest<Theme>(entityName: "Theme")
    }

    @NSManaged public var name: String?
    @NSManaged public var pin: NSSet?

}

// MARK: Generated accessors for pin
extension Theme {

    @objc(addPinObject:)
    @NSManaged public func addToPin(_ value: PinInfo)

    @objc(removePinObject:)
    @NSManaged public func removeFromPin(_ value: PinInfo)

    @objc(addPin:)
    @NSManaged public func addToPin(_ values: NSSet)

    @objc(removePin:)
    @NSManaged public func removeFromPin(_ values: NSSet)

}

extension Theme : Identifiable {

}
