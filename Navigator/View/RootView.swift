//
//  RootView.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import SwiftUI

struct RootView: View {

    // MARK: - Properties

    @StateObject var viewModel: RootViewModel

    // MARK: - View

    var body: some View {
        
        NavigationStack(path: $viewModel.paths) {
            FirstContentView(viewModel: viewModel.firstContentViewModel)
                .navigationDestination(for: RootViewModel.Path.self) { path in
                    switch path {
                    case .first(let viewModel):
                        FirstContentView(viewModel: viewModel)
                    case .second(let viewModel):
                        SecondContentView(viewModel: viewModel)
                    case .third(let viewModel):
                        ThirdContentView(viewModel: viewModel)
                    }
                }
        }

    }
}
