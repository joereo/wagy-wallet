// Copyright SIX DAY LLC. All rights reserved.

import XCTest
@testable import AlphaWallet

class LockEnterPasscodeCoordinatorTest: XCTestCase {
    func testStart() {
        let viewModel = LockEnterPasscodeViewModel()
        let fakeLock = FakeLockProtocol()
        let coordinator = LockEnterPasscodeCoordinator(model: viewModel, lock: fakeLock)
        XCTAssertTrue(coordinator.window.isHidden)
        coordinator.start()
        XCTAssertFalse(coordinator.window.isHidden)
        coordinator.stop()
    }
    func testStop() {
        let viewModel = LockEnterPasscodeViewModel()
        let fakeLock = FakeLockProtocol()
        let coordinator = LockEnterPasscodeCoordinator(model: viewModel, lock: fakeLock)
        coordinator.start()
        XCTAssertFalse(coordinator.window.isHidden)
        coordinator.stop()
        XCTAssertTrue(coordinator.window.isHidden)
    }
    func testDisableLock() {
        let viewModel = LockEnterPasscodeViewModel()
        let fakeLock = FakeLockProtocol()
        fakeLock.passcodeSet = false 
        let coordinator = LockEnterPasscodeCoordinator(model: viewModel, lock: fakeLock)
        XCTAssertTrue(coordinator.window.isHidden)
        coordinator.start()
        XCTAssertTrue(coordinator.window.isHidden)
        coordinator.stop()
    }
}
