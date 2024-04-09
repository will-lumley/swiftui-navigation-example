//
//  MockNavigationCoordinator.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation

class MockNavigationCoordinator: NavigationCoordinator {

    // MARK: - Types

    typealias OnPush = (_ path: any Hashable) -> Void
    typealias OnPop = () -> Void

    let onPush: OnPush?
    let onPop: OnPop?

    // MARK: - Lifecycle

    init() {
        self.onPush = nil
        self.onPop = nil
    }

    init(onPush: @escaping OnPush, onPop: @escaping OnPop) {
        self.onPush = onPush
        self.onPop = onPop
    }

    // MARK: - NavigationCoordinator

    func push(_ path: any Hashable) {
        onPush?(path)
    }

    func popLast() {
        onPop?()
    }

}
