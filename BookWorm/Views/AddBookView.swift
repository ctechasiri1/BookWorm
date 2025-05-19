//
//  AddBookView.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/8/25.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = [
        "Fantasy",
        "Horror",
        "Kids",
        "Mystery",
        "Poetry",
        "Romance",
        "Thriller"
    ]
    
    // NOTE: alternative to default values and prevents of saving if fields aren't saved
//    var isDataEmpty: Bool {
//        title.trimmingCharacters(in: .whitespaces).isEmpty &&
//        author.trimmingCharacters(in: .whitespaces).isEmpty
//    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0) // the genre being looped through if 0 it would give index
                        }
                    }
                }
                
                Section("Write a reivew") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    // NOTE: alternative to default values and prevents of saving if fields aren't saved
//                    .disabled(isDataEmpty)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
