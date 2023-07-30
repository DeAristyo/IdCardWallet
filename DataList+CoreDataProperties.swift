//
//  DataList+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 24/07/23.
//
//

import Foundation
import CoreData


extension DataList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataList> {
        return NSFetchRequest<DataList>(entityName: "DataList")
    }

    @NSManaged public var contactAddress: String?
    @NSManaged public var contactBirthday: Date?
    @NSManaged public var contactEmail: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var fullName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var accountList: DataPeople?

}

extension DataList : Identifiable {

}
