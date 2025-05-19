//
//  BookModel.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/8/25.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}

extension Book {
    var displayTitle: String {
        title.isEmpty ? "Untitled" : title
    }
    
    var displayAuthor: String {
        author.isEmpty ? "Unknown author" : author
    }
}
