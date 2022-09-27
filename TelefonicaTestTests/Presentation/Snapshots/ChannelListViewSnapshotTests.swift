//
//  ChannelListViewSnapshotTests.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Factory
import SnapshotTesting
import Quick
import Nimble

class ChannelListViewSnapshotSpec: QuickSpec {
    override func spec() {
        isRecording = false

        beforeEach {
            Container.Registrations.push()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a ChannelListView with 3 channels") {
            setupMocks()
            let mockMainCoordinator = MockMainCoordinator()
            let viewModel = ChannelListViewModel(coordinator: mockMainCoordinator)
            let view = ChannelListView(viewModel: viewModel)

            context("WHEN init") {
                it("THEN snapshot match") {
                    assertSnapshot(matching: view, as: .image(layout: .fixed(width: 375, height: 667)))
                }
            }
        }

        func setupMocks() {
            Container.getChannelsUseCase.register { MockGetChannelsUseCase() }
            Container.getCurrentTimeUseCase.register { MockGetCurrentTimeUseCase() }
            Container.isProgramAvailableUseCase.register {
                MockIsProgramAvailableUseCase(available: true)
            }
        }
    }
}
