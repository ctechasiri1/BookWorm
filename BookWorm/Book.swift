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
    var date: Date? = Date.now
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date?) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}

extension Book {
    var displayTitle: String {
        title.isEmpty ? "Untitled" : title
    }
    
    var displayAuthor: String {
        author.isEmpty ? "Unknown author" : author
    }
    
    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    } ()
    
    var displayDate: String {
        guard let date else {
            return ""
        }
        return Self.displayDateFormatter.string(from: date)
    }
}
