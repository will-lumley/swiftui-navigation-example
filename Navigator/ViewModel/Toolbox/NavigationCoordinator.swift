//
//  NavigationCoordinator.swift
//  Navigator
//
//  Created by William Lumley on 8/4/2024.
//

import Foundation

public protocol NavigationCoordinator {

    func push(_ path: any Hashable)
    func popLast()

}
