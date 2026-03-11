//
//  ContentView.swift
//  JournalApp
//
//  Created by Jay Chestnut on 3/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Text("New Entry")
                        .font(.title2)
                        .bold()
                    Spacer()
                }

                EntryFormView(entry: nil)

                Spacer()

                NavigationLink {
                    EntryListView()
                } label: {
                    Label("View All Entries", systemImage: "list.bullet")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
