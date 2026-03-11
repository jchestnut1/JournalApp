import SwiftUI

struct SettingsView: View {
    @AppStorage("settings.fontSize") private var fontSize: Double = 16
    @AppStorage("settings.darkMode") private var darkMode: Bool = false
    @AppStorage("settings.fontName") private var fontName: String = "System"

    private let fontOptions: [String] = [
        "System",
        "Times New Roman",
        "Helvetica Neue",
        "Georgia",
        "Avenir Next"
    ]

    var body: some View {
        Form {
            Section("Appearance") {
                Toggle("Dark Mode", isOn: $darkMode)
            }

            Section("Text") {
                HStack {
                    Text("Font Size")
                    Spacer()
                    Text("\(Int(fontSize))")
                        .foregroundStyle(.secondary)
                }
                Slider(value: $fontSize, in: 12...30, step: 1)

                Picker("Font Type", selection: $fontName) {
                    ForEach(fontOptions, id: \.self) { name in
                        Text(name).tag(name)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack { SettingsView() }
}
