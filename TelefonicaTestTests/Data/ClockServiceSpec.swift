//
//  ClockServiceSpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Factory
import Foundation
import Nimble
import Quick
import Combine

class ClockServiceSpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var currentTime: Date?

        beforeEach {
            Container.Registrations.push()
            self.setupMocks()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a ClockService") {
            context("WHEN get currentTime") {
                it("THEN publishs current time date") {
                    let service = ClockServiceImpl()

                    service.currentTime.sink(
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
        Container.urlSessionApiClient.register { MockApiClient<CurrentTimeDto>(data: ObjectMother.currentTimeDto) }
    }
}
