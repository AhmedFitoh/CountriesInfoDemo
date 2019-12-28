//
//  Country.swift
//  CountriesInfoDemo
//
//  Created by AhmedFitoh on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

typealias Countries = [Country]

struct Country: Codable {
    let name, capital: String?
    let currencies: [Currency?]
}

struct Currency: Codable {
    let code, name, symbol: String?
}

