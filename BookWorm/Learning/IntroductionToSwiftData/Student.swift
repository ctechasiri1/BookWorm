//
//  Student.swift
//  BookWorm
//
//  Created by Chiraphat Techasiri on 5/6/25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
