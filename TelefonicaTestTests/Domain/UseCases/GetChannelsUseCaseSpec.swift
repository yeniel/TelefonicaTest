//
//  GetChannelsUseCaseSpec.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick

class GetChannelsUseCaseSpec: QuickSpec {
    override func spec() {
        var useCase: GetChannelsUseCase!
        var cancellables = Set<AnyCancellable>()
        var channels: [Channel]?

        beforeEach {
            channels = nil
            self.setupMocks()
        }

        describe("GIVEN a GetChannelListUseCase") {
            context("WHEN execute") {
                it("THEN publishs a sorted list of channels") {
                    useCase = Container.getChannelsUseCase()

                    useCase.execute()
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { channels = $0 }
                        )
                        .store(in: &cancellables)

                    expect(channels).toEventually(equal(ObjectMother.channelListSortedById))
                }
            }
        }
    }

    func setupMocks() {
        Container.channelRepository.register { MockChannelRepository() }
    }
}

struct MockChannelRepository: ChannelRepository {
    func getChannels() -> AnyPublisher<[Channel], TelefonicaError> {
        Just(ObjectMother.channelList).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}
