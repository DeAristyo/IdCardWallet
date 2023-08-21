//
//  PersonDetail+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 31/07/23.
//
//

import Foundation
import CoreData

extension PersonDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonDetail> {
        return NSFetchRequest<PersonDetail>(entityName: "PersonDetail")
    }

    @NSManaged public var personFullName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var email: String?
    @NSManaged public var birthday: Date?
    @NSManaged public var address: String?
    @NSManaged public var personDetailID: PersonData?

}
