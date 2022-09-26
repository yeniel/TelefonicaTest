//
//  LiveProgramRepositorySpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 26/9/22.
//

import Factory
import Foundation
import Nimble
import Quick
import Combine

class LiveProgramRepositorySpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var liveProgram: LiveProgram?

        beforeEach {
            Container.Registrations.push()
            self.setupMocks()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a LiveProgramRepository") {
            context("WHEN get live program") {
                it("THEN publishs live program") {
                    let repository = LiveProgramRepositoryImpl()

                    repository.getLiveProgram(id: 24677).sink(
                        receiveCompletion: { _ in },
                        receiveValue: { liveProgram = $0 }
                    )
                    .store(in: &cancellables)

                    expect(liveProgram).toEventually(equal(ObjectMother.liveProgram))
                }
            }
        }
    }

    func setupMocks() {
        Container.urlSessionApiClient.register { MockApiClient<LiveProgramDto>(data: ObjectMother.liveProgramDto) }
    }
}
