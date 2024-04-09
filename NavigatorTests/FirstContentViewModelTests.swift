//
//  FirstContentViewModelTests.swift
//  NavigatorTests
//
//  Created by William Lumley on 8/4/2024.
//

@testable import Navigator
import XCTest

final class FirstContentViewModelTests: XCTestCase {

    func testNavigation() throws {
        var pushed: (any Hashable)?
        var popped = false

        // Create our MockNavigationCoordinator so we can listen to push/pop events
        let navigator = MockNavigationCoordinator(
            onPush: {
                // Record what path was just pushed
                pushed = $0
            },
            onPop: {
                // Record that we just popped
                popped = true
            }
        )

        // Setup our TestSubject
        let testSubject = FirstContentViewModel(navigator: navigator, text: "test text")

        // We'll do some basic house cleaning
        XCTAssertEqual(testSubject.text, "test text")

        // Tell our FirstContentViewModel to select our next button
        testSubject.nextButtonSelected()

        // A path should just now be pushed onto our NavigationCoordinator
        let pushedPath = try XCTUnwrap(pushed as? RootViewModel.Path)

        // And that path should contain a SecondContentViewModel
        guard case .second(let secondViewModel) = pushedPath else {
            XCTFail("Incorrect type returned")
            return
        }

        // The SecondContentViewModel should contain the correct properties
        XCTAssertEqual(secondViewModel.text, "Second!")

        // If we go back with our SecondContentViewModel...
        secondViewModel.backButtonSelected()

        // ...we should have that recorded
        XCTAssertTrue(popped)
    }

}
