//
//  EmployeeModel.swift
//  mvvmDemo
//
//  Created by mac on 18/07/21.
//

import Foundation

struct Country: Codable {
    let country, slug, iso2: String

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
    }
}

typealias Countries = [Country]
