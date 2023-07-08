//
//  Address+CoreDataProperties.swift
//  Nav
//
//  Created by 박재경 on 2023/07/01.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var detailAddress: String?
    @NSManaged public var district: String?
    @NSManaged public var postalCode: Int16
    @NSManaged public var streetAddress: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var relationship: PinInfo?

}
