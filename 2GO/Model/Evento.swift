// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let evento = try? newJSONDecoder().decode(Evento.self, from: jsonData)

import Foundation

// MARK: - Evento
struct Evento: Codable {
    let pagination: Pagination
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let name, eventDescription: Description
    let id: String
    let url: String
    let start, end: End
    let organizationID: String
    let created, changed: Date
    let published: Date?
    let capacity, capacityIsCustom: JSONNull?
    let status: Status
    let currency: Currency
    let listed, shareable, onlineEvent: Bool
    let txTimeLimit: Int
    let hideStartDate, hideEndDate: Bool
    let locale: String
    let isLocked: Bool
    let privacySetting: PrivacySetting
    let isSeries, isSeriesParent: Bool
    let inventoryType: InventoryType
    let isReservedSeating, showPickASeat, showSeatmapThumbnail, showColorsInSeatmapThumbnail: Bool
    let source: Source?
    let isFree: Bool
    let version: Version
    let summary: String
    let logoID: String?
    let organizerID, venueID, categoryID: String
    let subcategoryID: String?
    let formatID: String
    let resourceURI: String
    let isExternallyTicketed: Bool
    let logo: Logo?
    let vanityURL: String?
    let seriesID: String?

    enum CodingKeys: String, CodingKey {
        case name
        case eventDescription = "description"
        case id, url, start, end
        case organizationID = "organization_id"
        case created, changed, published, capacity
        case capacityIsCustom = "capacity_is_custom"
        case status, currency, listed, shareable
        case onlineEvent = "online_event"
        case txTimeLimit = "tx_time_limit"
        case hideStartDate = "hide_start_date"
        case hideEndDate = "hide_end_date"
        case locale
        case isLocked = "is_locked"
        case privacySetting = "privacy_setting"
        case isSeries = "is_series"
        case isSeriesParent = "is_series_parent"
        case inventoryType = "inventory_type"
        case isReservedSeating = "is_reserved_seating"
        case showPickASeat = "show_pick_a_seat"
        case showSeatmapThumbnail = "show_seatmap_thumbnail"
        case showColorsInSeatmapThumbnail = "show_colors_in_seatmap_thumbnail"
        case source
        case isFree = "is_free"
        case version, summary
        case logoID = "logo_id"
        case organizerID = "organizer_id"
        case venueID = "venue_id"
        case categoryID = "category_id"
        case subcategoryID = "subcategory_id"
        case formatID = "format_id"
        case resourceURI = "resource_uri"
        case isExternallyTicketed = "is_externally_ticketed"
        case logo
        case vanityURL = "vanity_url"
        case seriesID = "series_id"
    }
}

enum Currency: String, Codable {
    case aud = "AUD"
    case brl = "BRL"
    case cad = "CAD"
    case eur = "EUR"
    case gbp = "GBP"
    case hkd = "HKD"
    case usd = "USD"
}

// MARK: - End
struct End: Codable {
    let timezone, local: String
    let utc: Date
}

// MARK: - Description
struct Description: Codable {
    let text, html: String
}

enum InventoryType: String, Codable {
    case limited = "limited"
    case reserved = "reserved"
}

// MARK: - Logo
struct Logo: Codable {
    let cropMask: CropMask?
    let original: Original
    let id: String
    let url: String
    let aspectRatio, edgeColor: String?
    let edgeColorSet: Bool

    enum CodingKeys: String, CodingKey {
        case cropMask = "crop_mask"
        case original, id, url
        case aspectRatio = "aspect_ratio"
        case edgeColor = "edge_color"
        case edgeColorSet = "edge_color_set"
    }
}

// MARK: - CropMask
struct CropMask: Codable {
    let topLeft: TopLeft
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case topLeft = "top_left"
        case width, height
    }
}

// MARK: - TopLeft
struct TopLeft: Codable {
    let x, y: Int
}

// MARK: - Original
struct Original: Codable {
    let url: String
    let width, height: Int?
}

enum PrivacySetting: String, Codable {
    case unlocked = "unlocked"
}

enum Source: String, Codable {
    case apiv3Android = "apiv3_android"
    case coyote = "coyote"
    case create20 = "create_2.0"
}

enum Status: String, Codable {
    case live = "live"
    case started = "started"
}

enum Version: String, Codable {
    case the300 = "3.0.0"
    case the370 = "3.7.0"
    case the400 = "4.0.0"
}

// MARK: - Pagination
struct Pagination: Codable {
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
