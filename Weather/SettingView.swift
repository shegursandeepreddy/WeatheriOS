//
//  SettingView.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-08-02.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false

    var body: some View {
        List {
            Section(header: Text("App Settings")) {
                NavigationLink(destination: NotificationSettingView()) {
                    Text("Notification Settings")
                }

                Toggle("Dark Mode", isOn: $isDarkModeEnabled)
                    .onChange(of: isDarkModeEnabled) { newValue in
                        toggleDarkMode()
                    }
            }
        }
        .navigationTitle("Settings")
    }
    private func toggleDarkMode() {
           let appearance = isDarkModeEnabled ? UIUserInterfaceStyle.dark : UIUserInterfaceStyle.light
           UIApplication.shared.windows.first?.overrideUserInterfaceStyle = appearance
       }
}

struct NotificationSettingView: View {
    var body: some View {
        Text("Notification Setting View")
    }
}
