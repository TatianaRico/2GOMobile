//
//  Categoria.swift
//  2GO
//
//  Created by Tatiana Rico on 06/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation

// MARK: - Categoria
struct Categoria: Codable {
    let locale: String
    let pagination: PaginationEvent
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let resourceURI: String
    let id, name, nameLocalized, shortName: String
    let shortNameLocalized: String

    enum CodingKeys: String, CodingKey {
        case resourceURI = "resource_uri"
        case id, name
        case nameLocalized = "name_localized"
        case shortName = "short_name"
        case shortNameLocalized = "short_name_localized"
    }
}

// MARK: - Pagination
struct PaginationEvent: Codable {
    let objectCount, pageNumber, pageSize, pageCount: Int
    let hasMoreItems: Bool

    enum CodingKeys: String, CodingKey {
        case objectCount = "object_count"
        case pageNumber = "page_number"
        case pageSize = "page_size"
        case pageCount = "page_count"
        case hasMoreItems = "has_more_items"
    }
}


 
