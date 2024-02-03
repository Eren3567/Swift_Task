//
//  BookData.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import Foundation

// Empty
struct Alldata: Codable {
    let feed: Feed
}

// Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

// Author
struct Author: Codable {
    let name: String
    let url: String
}

// Link
struct Link: Codable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// Result
struct Result: Codable {
    let artistName, id, name, releaseDate: String
    let kind: Kind
    let artistID: String?
    let artistURL: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: ContentAdvisoryRating?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

enum ContentAdvisoryRating: String, Codable {
    case explict = "Explict"
}

//  Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case books = "books"
}
