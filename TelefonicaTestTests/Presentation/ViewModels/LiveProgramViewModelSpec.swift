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
        var viewModel: LiveProgramViewModel!

        beforeEach {
            Container.Registrations.push()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a LiveProgramViewModel") {
            context("WHEN init") {
                setupMocks()
                viewModel = LiveProgramViewModel(liveProgramId: 24677)

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
        }
    }
}

class MockGetLiveProgramUseCase: GetLiveProgramUseCase {
    override func execute(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError> {
        Just(ObjectMother.liveProgram).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}
