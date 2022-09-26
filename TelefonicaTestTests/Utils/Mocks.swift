//
//  Mocks.swift
//  TelefonicaTestTests
//
//  Created by Yeniel Landestoy on 25/9/22.
//

import Foundation
import Combine

// swiftlint:disable force_cast

class MockApiClient<S>: ApiClient {
    var data: S

    init(data: S) {
        self.data = data
    }

    func get<T>(path: String) -> AnyPublisher<T, TelefonicaError> where T: Decodable {
        Just(data as! T).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

class MockGetChannelsUseCase: GetChannelsUseCase {
    override func execute() -> AnyPublisher<[Channel], TelefonicaError> {
        Just(ObjectMother.channelListSortedById).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

class MockGetCurrentTimeUseCase: GetCurrentTimeUseCase {
    override func execute() -> AnyPublisher<Date, TelefonicaError> {
        Just(ObjectMother.currentTime).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

class MockIsProgramAvailableUseCase: IsProgramAvailableUseCase {
    let available: Bool

    init(available: Bool) {
        self.available = available
    }

    override func execute(programId: Int) -> Bool {
        return available
    }
}

final class MockMainCoordinator: MainCoordinatorProtocol {
    var routed: Bool = false

    func routeToLiveProgram(id: Int) {
        routed = true
    }
}

class MockGetLiveProgramUseCase: GetLiveProgramUseCase {
    override func execute(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError> {
        Just(ObjectMother.liveProgram).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
    }
}

struct MockChannelRepository: ChannelRepository {
    func getChannels() -> AnyPublisher<[Channel], TelefonicaError> {
        Just(ObjectMother.channelList).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
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

struct MockClockService: ClockService {
    var currentTime: AnyPublisher<Date, TelefonicaError> {
        Just(ObjectMother.currentTime)
            .setFailureType(to: TelefonicaError.self)
            .eraseToAnyPublisher()
    }
}

// swiftlint:enable force_cast
