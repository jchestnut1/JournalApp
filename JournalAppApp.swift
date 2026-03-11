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
    @AppStorage("settings.darkMode") private var darkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
            }
            .preferredColorScheme(darkMode ? .dark : .light)
        }
        .modelContainer(for: JournalEntry.self)
    }
}
