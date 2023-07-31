//
//  PersonNote+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 31/07/23.
//
//

import Foundation
import CoreData


extension PersonNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonNote> {
        return NSFetchRequest<PersonNote>(entityName: "PersonNote")
    }

    @NSManaged public var notePerson: String?
    @NSManaged public var noteTitle: String?
    @NSManaged public var wayOfInteraction: String?
    @NSManaged public var contactDate: Date?
    @NSManaged public var personDataNotes: PersonData?

}
