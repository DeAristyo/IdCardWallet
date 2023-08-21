//
//  PersonReminder+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 31/07/23.
//
//

import Foundation
import CoreData

extension PersonReminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonReminder> {
        return NSFetchRequest<PersonReminder>(entityName: "PersonReminder")
    }

    @NSManaged public var reminderTitle: String?
    @NSManaged public var reminderNote: String?
    @NSManaged public var reminderFullName: String?
    @NSManaged public var reminderDate: Date?
    @NSManaged public var reminderTime: String?
    @NSManaged public var reminderLocation: String?
    @NSManaged public var personDataReminder: PersonData?

}
