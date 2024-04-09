//
//  FirstContentView.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import SwiftUI

struct FirstContentView: View {

    // MARK: - Properties

    @StateObject var viewModel: FirstContentViewModel

    // MARK: - View

    var body: some View {
        VStack {
            Text(viewModel.text)
                .font(.headline)
                .padding()

            Spacer()

            Button("Next Screen") {
                viewModel.nextButtonSelected()
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
        }
        .navigationTitle("First View")
    }
}

#Preview {
    FirstContentView(
        viewModel: .init(
            navigator: MockNavigationCoordinator(),
            text: "Test"
        )
    )
}
