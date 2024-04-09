//
//  SecondContentViewModel.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation

public final class SecondContentViewModel: ObservableObject {

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

public extension SecondContentViewModel {

    func nextButtonSelected() {
        self.navigator.push(
            RootViewModel.Path.third(
                .init(navigator: navigator, text: "Third!")
            )
        )
    }

    func backButtonSelected() {
        self.navigator.popLast()
    }

}

// MARK: - Hashable

extension SecondContentViewModel: Hashable {

    public static func == (lhs: SecondContentViewModel, rhs: SecondContentViewModel) -> Bool {
        return lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
    }
    
    
}
