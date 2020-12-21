//
//  ProductResponse.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import Foundation

// MARK: - NewsResponse
//struct News: Decodable {
//
//    let image,description, title: String?
//
//}

// MARK: - Welcome
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}

