//
//  LiveProgramViewModelSpec.swift
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

class LiveProgramViewModelSpec: QuickSpec {
    override func spec() {
        beforeEach {
            Container.Registrations.push()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a LiveProgramViewModel") {
            context("WHEN init") {
                setupMocks()
                let viewModel = LiveProgramViewModel(liveProgramId: 24677)

                it("THEN publishs a LiveProgramUIModel") {
                    expect(viewModel.liveProgram).toEventually(equal(ObjectMother.liveProgramUIModel))
                }

                it("THEN publishs loaded status") {
                    expect(viewModel.status).toEventually(equal(.loaded))
                }
            }
        }

        func setupMocks() {
            Container.getCurrentTimeUseCase.register { MockGetCurrentTimeUseCase() }
            Container.getLiveProgramUseCase.register { MockGetLiveProgramUseCase() }
            Container.dateFormatter.register {
                let dateFormatter = DateFormatter()

                dateFormatter.timeZone = TimeZone(identifier: "GMT")

                return dateFormatter
            }
        }
    }
}
