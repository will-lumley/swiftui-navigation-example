//
//  ThirdContentViewModel.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation

public final class ThirdContentViewModel: ObservableObject {

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

public extension ThirdContentViewModel {

    func backButtonSelected() {
        self.navigator.popLast()
    }

}

// MARK: - Hashable

extension ThirdContentViewModel: Hashable {

    public static func == (lhs: ThirdContentViewModel, rhs: ThirdContentViewModel) -> Bool {
        return lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
    }
    
    
}
