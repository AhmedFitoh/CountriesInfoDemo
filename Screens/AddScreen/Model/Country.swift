//
//  Country.swift
//  CountriesInfoDemo
//
//  Created by AhmedFitoh on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation
import CoreData

typealias Countries = [Country]

class Country: NSManagedObject, Decodable {
    @NSManaged var name, capital: String?
    @NSManaged var userChoice: Bool

//    @NSManaged var currencies: [Currency]
 
    enum CodingKeys: String, CodingKey {
        case name ,capital ,userChoice
    }
  
    required convenience init(from decoder: Decoder) throws {

        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext ,
            let entity = NSEntityDescription.entity(forEntityName: "Country", in: context) else {
                fatalError("Failed to decode User")
        }
        self.init(entity: entity, insertInto: nil)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.capital = try container.decodeIfPresent(String.self, forKey: .capital)
        self.userChoice = (try container.decodeIfPresent(Bool.self, forKey: .userChoice)) ?? false

    }
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
    }

}

extension Array where Element : Country {
     func contains(_ element: Element) -> Bool {
       return !filter { (singleItem) -> Bool in
            element == singleItem
        }.isEmpty
    }
    
}


@objc class Currency: NSManagedObject, Decodable {
    @NSManaged var code, name, symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case code ,name ,symbol
    }
    
    required convenience init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext ,
              let entity = NSEntityDescription.entity(forEntityName: "Currency", in: context) else {
                fatalError("Failed to decode User")
        }
        self.init(entity: entity, insertInto: nil)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
    }
    
}


extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
