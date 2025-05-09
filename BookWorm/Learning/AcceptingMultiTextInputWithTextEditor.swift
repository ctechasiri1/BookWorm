//
//  AcceptingMultiTextInputWithTextEditor.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/6/25.
//

import SwiftUI


// two ways to create multi-line text editor
struct AcceptingMultiTextInputWithTextEditor: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
// Option 1:
//        NavigationStack {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
//        }

// Option 2:
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            Spacer()
        }
    }
}

#Preview {
    AcceptingMultiTextInputWithTextEditor()
}
