//
//  GetLiveProgramUseCaseSpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick

class GetLiveProgramUseCaseSpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var liveProgram: LiveProgram?
        var error: TelefonicaError?

        beforeEach {
            Container.Registrations.push()
            error = nil
            liveProgram = nil
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a GetLiveProgramUsecase") {
            context("WHEN execute with id 24677") {
                it("THEN publishs a LiveProgram") {
                    self.setupMocks(showError: false)
                    let useCase = GetLiveProgramUseCase()

                    useCase.execute(id: 24677)
                        .catch { errorCatched -> AnyPublisher<LiveProgram, TelefonicaError> in
                            error = errorCatched
                            return Fail(error: errorCatched).eraseToAnyPublisher()
                        }
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { liveProgram = $0 }
                        )
                        .store(in: &cancellables)

                    expect(liveProgram).toEventually(equal(ObjectMother.liveProgram))
                    expect(error).toEventually(beNil())
                }
            }

            context("WHEN execute with id different than 24677") {
                it("THEN publishs a TelefonicaError.liveProgramNotFound") {
                    self.setupMocks(showError: true)
                    let useCase = GetLiveProgramUseCase()

                    useCase.execute(id: 12304)
                        .catch { errorCatched -> AnyPublisher<LiveProgram, TelefonicaError> in
                            error = errorCatched
                            return Fail(error: errorCatched).eraseToAnyPublisher()
                        }
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { liveProgram = $0 }
                        )
                        .store(in: &cancellables)

                    expect(error).toEventually(equal(.liveProgramNotFound))
                    expect(liveProgram).toEventually(beNil())
                }
            }
        }
    }

    func setupMocks(showError: Bool) {
        Container.liveProgramRepository.register { MockLiveProgramRepository(showError: showError) }
    }
}

struct MockLiveProgramRepository: LiveProgramRepository {
    let showError: Bool

    func getLiveProgram(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError> {
        if showError {
            return Fail(error: TelefonicaError.liveProgramNotFound).eraseToAnyPublisher()
        } else {
            return Just(ObjectMother.liveProgram).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
        }
    }
}
