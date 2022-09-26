//
//  ChannelRepositorySpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 26/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick

class ChannelRepositorySpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var channels: [Channel]?

        beforeEach {
            Container.Registrations.push()
            self.setupMocks()
        }

        afterEach {
            Container.Registrations.pop()
        }

        describe("GIVEN a ChannelRepository") {
            context("WHEN get channels") {
                it("THEN publishs channels") {
                    let repository = ChannelRepositoryImpl()

                    repository.getChannels().sink(
                        receiveCompletion: { _ in },
                        receiveValue: { channels = $0 }
                    )
                    .store(in: &cancellables)

                    expect(channels).toEventually(equal(ObjectMother.channelList))
                }
            }
        }
    }

    func setupMocks() {
        Container.urlSessionApiClient.register { MockApiClient<ChannelListDto>(data: ObjectMother.channelListDto) }
    }
}
