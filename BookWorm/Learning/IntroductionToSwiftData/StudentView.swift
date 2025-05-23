//
//  StudentView.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/6/25.
//

import SwiftData
import SwiftUI

struct StudentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    StudentView()
}

// this is how the app should look like for the model container
/*
 import SwiftData
 import SwiftUI

 @main
 struct BookWormApp: App {
     var body: some Scene {
         WindowGroup {
             StudentView()
         }
         .modelContainer(for: Student.self)
     }
 }
 */
