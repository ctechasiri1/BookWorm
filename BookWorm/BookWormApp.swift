//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/6/25.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
