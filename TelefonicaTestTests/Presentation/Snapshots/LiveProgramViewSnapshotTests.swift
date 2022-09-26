//
//  LiveProgramViewSnapshotTests.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Factory
import SnapshotTesting
import Quick
import Nimble
import Foundation

class LiveProgramViewSnapshotSpec: QuickSpec {
    override func spec() {
        isRecording = false
        SnapshotTesting.diffTool = "ksdiff"

        beforeEach {
            Container.Registrations.push()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a LiveProgramView") {
            setupMocks()
            let viewModel = LiveProgramViewModel(liveProgramId: 24677)
            let view = LiveProgramView(viewModel: viewModel)

            context("WHEN init") {
                it("THEN snapshot match") {
                    assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone13)))
                }
            }
        }

        func setupMocks() {
            Container.getLiveProgramUseCase.register { MockGetLiveProgramUseCase() }
            Container.getCurrentTimeUseCase.register { MockGetCurrentTimeUseCase() }
            Container.dateFormatter.register {
                let dateFormatter = DateFormatter()

                dateFormatter.timeZone = TimeZone(identifier: "GMT")

                return dateFormatter
            }
        }
    }
}
