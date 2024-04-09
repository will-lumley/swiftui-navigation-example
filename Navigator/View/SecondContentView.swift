//
//  SecondContentView.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import SwiftUI

struct SecondContentView: View {

    // MARK: - Properties

    @StateObject var viewModel: SecondContentViewModel

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

            Button("Back") {
                viewModel.backButtonSelected()
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
        }
        .navigationTitle("Second View")
    }
}

#Preview {
    SecondContentView(
        viewModel: .init(
            navigator: MockNavigationCoordinator(),
            text: "Test"
        )
    )
}
