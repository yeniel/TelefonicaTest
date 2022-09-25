//
//  ChannelListViewModelSpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick
import Stinsen

class ChannelListViewModelSpec: QuickSpec {
    override func spec() {
        var mockCoordinator: MockMainCoordinator!

        beforeEach {
            Container.Registrations.push()
        }

        afterEach {
            Container.Registrations.pop()
        }
        describe("GIVEN a ChannelListViewModel") {
            context("WHEN init") {
                setupMocks()
                let viewModel = ChannelListViewModel(coordinator: mockCoordinator)

                it("THEN publishs a list of channel ui model") {
                    expect(viewModel.channelList).toEventually(equal(ObjectMother.channelUIModelList))
                }

                it("THEN publishs loaded status") {
                    expect(viewModel.status).toEventually(equal(.loaded))
                }
            }

            context("WHEN route to program and program is available") {
                it("THEN routes to live program view") {
                    setupMocks(isProgramAvailable: true)
                    let viewModel = ChannelListViewModel(coordinator: mockCoordinator)

                    viewModel.routeToProgram(id: 24667)

                    expect(mockCoordinator.routed).toEventually(beTrue())
                }
            }

            context("WHEN route to program and program is not available") {
                it("THEN publish showError as true") {
                    setupMocks(isProgramAvailable: false)
                    let viewModel = ChannelListViewModel(coordinator: mockCoordinator)

                    viewModel.routeToProgram(id: 12304)

                    expect(mockCoordinator.routed).toEventually(beFalse())
                    expect(viewModel.showError).toEventually(beTrue())
                }
            }
        }

        func setupMocks(isProgramAvailable: Bool = true) {
            Container.getChannelsUseCase.register { MockGetChannelsUseCase() }
            Container.getCurrentTimeUseCase.register { MockGetCurrentTimeUseCase() }
            Container.isProgramAvailableUseCase.register {
                MockIsProgramAvailableUseCase(available: isProgramAvailable)
            }

            mockCoordinator = MockMainCoordinator()

            let mockNavigationRouter = NavigationRouter(
                id: 0,
                coordinator: mockCoordinator as MainCoordinatorProtocol
            )

            RouterStore.shared.store(router: mockNavigationRouter)
        }
    }
}

class MockGetChannelsUseCase: GetChannelsUseCase {
    override func execute() -> AnyPublisher<[Channel], TelefonicaError> {
        Just(ObjectMother.channelListSortedById).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

class MockGetCurrentTimeUseCase: GetCurrentTimeUseCase {
    override func execute() -> AnyPublisher<Date, TelefonicaError> {
        Just(ObjectMother.currentTime).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

class MockIsProgramAvailableUseCase: IsProgramAvailableUseCase {
    let available: Bool

    init(available: Bool) {
        self.available = available
    }

    override func execute(programId: Int) -> Bool {
        return available
    }
}

final class MockMainCoordinator: MainCoordinatorProtocol {
    var routed: Bool = false

    func routeToLiveProgram(id: Int) {
        routed = true
    }
}
