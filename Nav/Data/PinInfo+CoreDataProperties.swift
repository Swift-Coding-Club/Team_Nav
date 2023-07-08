//
//  PinInfo+CoreDataProperties.swift
//  Nav
//
//  Created by 박재경 on 2023/07/01.
//
//

import Foundation
import CoreData


extension PinInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PinInfo> {
        return NSFetchRequest<PinInfo>(entityName: "PinInfo")
    }

    @NSManaged public var content: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var title: String?
    @NSManaged public var updateDate: Date?
    @NSManaged public var address: Address?
    @NSManaged public var pictures: NSSet?
    @NSManaged public var theme: Theme?

}

// MARK: Generated accessors for pictures
extension PinInfo {

    @objc(addPicturesObject:)
    @NSManaged public func addToPictures(_ value: Pictures)

    @objc(removePicturesObject:)
    @NSManaged public func removeFromPictures(_ value: Pictures)

    @objc(addPictures:)
    @NSManaged public func addToPictures(_ values: NSSet)

    @objc(removePictures:)
    @NSManaged public func removeFromPictures(_ values: NSSet)

}
