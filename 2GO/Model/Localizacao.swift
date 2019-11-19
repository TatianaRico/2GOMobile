////
////  Localizacao.swift
////  2GO
////
////  Created by Mônica Marques on 10/11/19.
////  Copyright © 2019 2GO. All rights reserved.
////
//
//import Foundation
//
//// MARK: - Localizacao
//struct Localizacao: Codable {
//    let pagination: PaginationLocation?
//    let events: [EventLocation]?
//    let location: Location?
//}
//
//// MARK: - Event
//struct EventLocation: Codable {
//    let name, eventDescription: DescriptionLocation?
//    let id: String?
//    let url: String?
//    let start, end: EndLocation?
//    let organizationID: String?
//    let created, changed, published: String?
//    let capacity, capacityIsCustom: JSONNull?
//    let status, currency: String?
//    let listed, shareable, onlineEvent: Bool?
//    let txTimeLimit: Int?
//    let hideStartDate, hideEndDate: Bool?
//    let locale: String?
//    let isLocked: Bool?
//    let privacySetting: String?
//    let isSeries, isSeriesParent: Bool?
//    let inventoryType: String?
//    let isReservedSeating, showPickASeat, showSeatmapThumbnail, showColorsInSeatmapThumbnail: Bool?
//    let source: String?
//    let isFree: Bool?
//    let version, summary, logoID, organizerID: String?
//    let venueID, categoryID: String?
//    let subcategoryID: String?
//    let formatID: String?
//    let resourceURI: String?
//    let isExternallyTicketed: Bool?
//    let logo: LogoLocation?
//    let organizer: Organizer?
//    let venue: Venue?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case eventDescription = "description"
//        case id, url, start, end
//        case organizationID = "organization_id"
//        case created, changed, published, capacity
//        case capacityIsCustom = "capacity_is_custom"
//        case status, currency, listed, shareable
//        case onlineEvent = "online_event"
//        case txTimeLimit = "tx_time_limit"
//        case hideStartDate = "hide_start_date"
//        case hideEndDate = "hide_end_date"
//        case locale
//        case isLocked = "is_locked"
//        case privacySetting = "privacy_setting"
//        case isSeries = "is_series"
//        case isSeriesParent = "is_series_parent"
//        case inventoryType = "inventory_type"
//        case isReservedSeating = "is_reserved_seating"
//        case showPickASeat = "show_pick_a_seat"
//        case showSeatmapThumbnail = "show_seatmap_thumbnail"
//        case showColorsInSeatmapThumbnail = "show_colors_in_seatmap_thumbnail"
//        case source
//        case isFree = "is_free"
//        case version, summary
//        case logoID = "logo_id"
//        case organizerID = "organizer_id"
//        case venueID = "venue_id"
//        case categoryID = "category_id"
//        case subcategoryID = "subcategory_id"
//        case formatID = "format_id"
//        case resourceURI = "resource_uri"
//        case isExternallyTicketed = "is_externally_ticketed"
//        case logo, organizer, venue
//    }
//}
//
//// MARK: - End
//struct EndLocation: Codable {
//    let timezone: Timezone?
//    let local: String?
//    let utc: String?
//}
//
//enum Timezone: String, Codable {
//    case asiaKolkata = "Asia/Kolkata"
//}
//
//// MARK: - Description
//struct DescriptionLocation: Codable {
//    let text, html: String?
//}
//
//// MARK: - Logo
//struct LogoLocation: Codable {
//    let cropMask: CropMask?
//    let original: Original?
//    let id: String?
//    let url: String?
//    let aspectRatio: String?
//    let edgeColor: String?
//    let edgeColorSet: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case cropMask = "crop_mask"
//        case original, id, url
//        case aspectRatio = "aspect_ratio"
//        case edgeColor = "edge_color"
//        case edgeColorSet = "edge_color_set"
//    }
//}
//
//// MARK: - TopLeft
//struct TopLeftLocation: Codable {
//    let x, y: Int?
//}
//
//
//// MARK: - Organizer
//struct Organizer: Codable {
//    let organizerDescription, longDescription: Description?
//    let resourceURI: String?
//    let type, id: String?
//    let name: String?
//    let url: String?
//    let numPastEvents, numFutureEvents: Int?
//    let website: String?
//    let twitter, facebook: String?
//    let organizationID: String?
//    let disableMarketingOptIn: Bool?
//    let logoID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case organizerDescription = "description"
//        case longDescription = "long_description"
//        case resourceURI = "resource_uri"
//        case type = "_type"
//        case id, name, url
//        case numPastEvents = "num_past_events"
//        case numFutureEvents = "num_future_events"
//        case website, twitter, facebook
//        case organizationID = "organization_id"
//        case disableMarketingOptIn = "disable_marketing_opt_in"
//        case logoID = "logo_id"
//    }
//}
//
//// MARK: - Venue
//struct Venue: Codable {
//    let address: Address?
//    let resourceURI: String?
//    let id: String?
//    let ageRestriction, capacity: JSONNull?
//    let name, latitude, longitude: String?
//
//    enum CodingKeys: String, CodingKey {
//        case address
//        case resourceURI = "resource_uri"
//        case id
//        case ageRestriction = "age_restriction"
//        case capacity, name, latitude, longitude
//    }
//}
//
//// MARK: - Address
//struct Address: Codable {
//    let address1: String?
//    let address2: String?
//    let city, region, postalCode, country: String?
//    let latitude, longitude, localizedAddressDisplay, localizedAreaDisplay: String?
//    let localizedMultiLineAddressDisplay: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case address1 = "address_1"
//        case address2 = "address_2"
//        case city, region
//        case postalCode = "postal_code"
//        case country, latitude, longitude
//        case localizedAddressDisplay = "localized_address_display"
//        case localizedAreaDisplay = "localized_area_display"
//        case localizedMultiLineAddressDisplay = "localized_multi_line_address_display"
//    }
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let latitude: String?
//    let augmentedLocation: AugmentedLocation?
//    let within, longitude, address: String?
//
//    enum CodingKeys: String, CodingKey {
//        case latitude
//        case augmentedLocation = "augmented_location"
//        case within, longitude, address
//    }
//}
//
//// MARK: - AugmentedLocation
//struct AugmentedLocation: Codable {
//    let city, region, country: String?
//}
//
//// MARK: - Pagination
//struct PaginationLocation: Codable {
//    let objectCount, pageNumber, pageSize, pageCount: Int?
//    let hasMoreItems: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case objectCount = "object_count"
//        case pageNumber = "page_number"
//        case pageSize = "page_size"
//        case pageCount = "page_count"
//        case hasMoreItems = "has_more_items"
//    }
//}
////
////// MARK: - Encode/decode helpers
////
////class JSONNull: Codable, Hashable {
////
////    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
////        return true
////    }
////
////    public var hashValue: Int {
////        return 0
////    }
////
////    public init() {}
////
////    public required init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
////        }
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        try container.encodeNil()
////    }
////}
