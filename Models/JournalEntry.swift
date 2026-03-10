//
//  JournalEntry.swift
//  JournalApp
//
//  Created by Jay Chestnut on 3/10/26.
//


import Foundation
import SwiftData

@Model
final class JournalEntry {
    var title: String
    var body: String
    var createdAt: Date
    var isFavorite: Bool


    init(title: String, body: String, createdAt: Date = .now, isFavorite: Bool = false) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isFavorite = isFavorite
    }
}
