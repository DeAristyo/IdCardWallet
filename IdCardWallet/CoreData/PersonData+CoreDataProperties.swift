//
//  PersonData+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 31/07/23.
//
//

import Foundation
import CoreData


extension PersonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonData> {
        return NSFetchRequest<PersonData>(entityName: "PersonData")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var occupation: String?
    @NSManaged public var fullNamePerson: PersonDetail?
    @NSManaged public var personNotes: NSSet?
    @NSManaged public var personReminder: NSSet?

}

// MARK: Generated accessors for personNotes
extension PersonData {

    @objc(addPersonNotesObject:)
    @NSManaged public func addToPersonNotes(_ value: PersonNote)

    @objc(removePersonNotesObject:)
    @NSManaged public func removeFromPersonNotes(_ value: PersonNote)

    @objc(addPersonNotes:)
    @NSManaged public func addToPersonNotes(_ values: NSSet)

    @objc(removePersonNotes:)
    @NSManaged public func removeFromPersonNotes(_ values: NSSet)

}

// MARK: Generated accessors for personReminder
extension PersonData {

    @objc(addPersonReminderObject:)
    @NSManaged public func addToPersonReminder(_ value: PersonReminder)

    @objc(removePersonReminderObject:)
    @NSManaged public func removeFromPersonReminder(_ value: PersonReminder)

    @objc(addPersonReminder:)
    @NSManaged public func addToPersonReminder(_ values: NSSet)

    @objc(removePersonReminder:)
    @NSManaged public func removeFromPersonReminder(_ values: NSSet)

}

extension PersonData : Identifiable {

}
