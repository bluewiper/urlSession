//
//  PhoneBook+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 단예진 on 7/10/24.
//
//

import Foundation
import CoreData


extension PhoneBook {
//fetchRequest : 데이터 접근 시 도움을 주는 클래스, 메서드 
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}

extension PhoneBook : Identifiable {

}
