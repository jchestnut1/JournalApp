//
//  EntryFormView.swift
//  JournalApp
//
//  Created by Jay Chestnut on 3/10/26.
//


import SwiftUI
import SwiftData

struct EntryFormView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let entry: JournalEntry? // nil = create

    @State private var title: String = ""
    @State private var entryBody: String = ""
    @State private var isFavorite: Bool = false
    @State private var createdAt: Date = Date()

    var body: some View {
        Form {
            Section("Title") {
                TextField("Title", text: $title)
            }

            Section("Body") {
                TextEditor(text: $entryBody)
                    .frame(minHeight: 180)
            }
            
            Section("Date") {
                DatePicker("Created At", selection: $createdAt, displayedComponents: [.date, .hourAndMinute])
            }

            Section {
                Toggle("Favorite", isOn: $isFavorite)
            }
        }
        .navigationTitle(entry == nil ? "New Entry" : "Edit Entry")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") { save() }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .onAppear {
            guard let entry else { return }
            title = entry.title
            entryBody = entry.body
            isFavorite = entry.isFavorite
            createdAt = entry.createdAt
        }
    }

    private func save() {
        let t = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let b = entryBody.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !t.isEmpty else { return }

        if let entry {
            entry.title = t
            entry.body = b
            entry.isFavorite = isFavorite
            entry.createdAt = createdAt
        } else {
            let newEntry: JournalEntry = JournalEntry(title: t, body: b, createdAt: createdAt, isFavorite: isFavorite)
            context.insert(newEntry)
            
            // Reset form for next entry when embedded (or keep consistent behavior)
            self.title = ""
            self.entryBody = ""
            self.isFavorite = false
            self.createdAt = Date()
        }

        dismiss()
    }
}

