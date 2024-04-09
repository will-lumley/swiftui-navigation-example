//
//  ThirdContentView.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import SwiftUI

struct ThirdContentView: View {

    // MARK: - Properties

    @StateObject var viewModel: ThirdContentViewModel

    // MARK: - View

    var body: some View {
        VStack {
            Text(viewModel.text)
                .font(.headline)
                .padding()

            Spacer()

            Button("Back") {
                viewModel.backButtonSelected()
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    ThirdContentView(
        viewModel: .init(
            navigator: MockNavigationCoordinator(),
            text: "Test"
        )
    )
}
