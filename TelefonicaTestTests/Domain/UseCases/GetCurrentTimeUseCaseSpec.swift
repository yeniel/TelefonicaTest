//
//  GetCurrentTimeUseCase.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick

class GetCurrentTimeUseCaseSpec: QuickSpec {
    override func spec() {
        var useCase: GetCurrentTimeUseCase!
        var cancellables = Set<AnyCancellable>()
        var currentTime: Date?

        beforeEach {
            Container.Registrations.push()
            currentTime = nil
            self.setupMocks()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a GetCurrentTimeUseCase") {
            context("WHEN execute") {
                it("THEN publishs the current time date") {
                    useCase = GetCurrentTimeUseCase()

                    useCase.execute()
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { currentTime = $0 }
                        )
                        .store(in: &cancellables)

                    expect(currentTime).toEventually(equal(ObjectMother.currentTime))
                }
            }
        }
    }

    func setupMocks() {
        Container.clockService.register { MockClockService() }
    }
}

struct MockClockService: ClockService {
    var currentTime: AnyPublisher<Date, TelefonicaError> {
        Just(ObjectMother.currentTime)
            .setFailureType(to: TelefonicaError.self)
            .eraseToAnyPublisher()
    }
}
