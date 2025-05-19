//
//  ContentView.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/6/25.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [ // this allows use to sort the list of books by title then author
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books : [Book]
    
    @State private var showingAddScreen: Bool =  false
    
    var body: some View {
        NavigationStack { // need a navigation stack to use navTitle and toolbar
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                                .foregroundStyle(book.rating == 1 ? Color.red : .primary)
                            
                            VStack(alignment: .leading) {
                                Text(book.displayTitle)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? Color.red : .primary)
                                Text(book.displayAuthor)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks) // lets use swipe to delete from list
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton() // functionality built into swift
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
                .navigationDestination(for: Book.self) { book in
                    DetailView(book: book)
                }
        }
    }
    
    // delete the books by locating index in the for loop
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find book in our query
            let book = books[offset]
            
            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
