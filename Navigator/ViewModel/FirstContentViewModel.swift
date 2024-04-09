//
//  FirstContentViewModel.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation

public final class FirstContentViewModel: ObservableObject {

    // MARK: - Properties

    @Published public var text: String

    private let navigator: NavigationCoordinator

    // MARK: - Lifecycle

    init(navigator: NavigationCoordinator, text: String) {
        self.navigator = navigator
        self.text = text
    }

}

// MARK: - Public

public extension FirstContentViewModel {

    func nextButtonSelected() {
        self.navigator.push(
            RootViewModel.Path.second(
                SecondContentViewModel(navigator: navigator, text: "Second!")
            )
        )
    }

}

// MARK: - Hashable

extension FirstContentViewModel: Hashable {

    public static func == (lhs: FirstContentViewModel, rhs: FirstContentViewModel) -> Bool {
        return lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
    }
    
    
}
