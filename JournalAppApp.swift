//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Jay Chestnut on 3/10/26.
//

import SwiftUI
import SwiftData

@main
struct JournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
            }
        }
        .modelContainer(for: JournalEntry.self)
    }
}
