//
//  NavigatorApp.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import SwiftUI

@main
struct NavigatorApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: .init())
        }
    }
}
