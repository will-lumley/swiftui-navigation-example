//
//  RootViewModel.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation
import SwiftUI

public class RootViewModel: ObservableObject, Identifiable {

    // MARK: - Types

    public enum Path: Hashable {
        case first(FirstContentViewModel)
        case second(SecondContentViewModel)
        case third(ThirdContentViewModel)
    }

    // MARK: - Properties

    public var id = UUID()

    /// The object that handles our navigation stack
    @Published public var paths = NavigationPath()

    /// The ViewModel that represents our first view in the navigation stack
    public lazy var firstContentViewModel: FirstContentViewModel = {
        .init(navigator: self, text: "First!")
    }()

}

// MARK: - NavigationCoordinator

extension RootViewModel: NavigationCoordinator {

    public func push(_ path: any Hashable) {
        DispatchQueue.main.async { [weak self] in
            self?.paths.append(path)
        }
    }

    public func popLast() {
        DispatchQueue.main.async { [weak self] in
            self?.paths.removeLast()
        }
    }

}

// MARK: - Preview Mock

public extension RootViewModel {

    static var mock: RootViewModel {
        .init()
    }

}
