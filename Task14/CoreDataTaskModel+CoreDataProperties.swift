//
//  CoreDataTaskModel+CoreDataProperties.swift
//  
//
//  Created by Андрей Фролов on 02.08.2021.
//
//

import Foundation
import CoreData


extension CoreDataTaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataTaskModel> {
        return NSFetchRequest<CoreDataTaskModel>(entityName: "CoreDataTaskModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var taskId: UUID?

}
