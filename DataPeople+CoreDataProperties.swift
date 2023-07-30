//
//  DataPeople+CoreDataProperties.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 24/07/23.
//
//

import Foundation
import CoreData


extension DataPeople {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataPeople> {
        return NSFetchRequest<DataPeople>(entityName: "DataPeople")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var userName: String?
    @NSManaged public var accountData: NSSet?

}

// MARK: Generated accessors for accountData
extension DataPeople {

    @objc(addAccountDataObject:)
    @NSManaged public func addToAccountData(_ value: DataList)

    @objc(removeAccountDataObject:)
    @NSManaged public func removeFromAccountData(_ value: DataList)

    @objc(addAccountData:)
    @NSManaged public func addToAccountData(_ values: NSSet)

    @objc(removeAccountData:)
    @NSManaged public func removeFromAccountData(_ values: NSSet)

}

extension DataPeople : Identifiable {

}
