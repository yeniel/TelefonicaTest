//
//  GetChannelsUseCase.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

struct GetChannelsUseCase {
    @Injected(Container.channelRepository)
    private var channelRepository

    func execute() -> AnyPublisher<[Channel], TelefonicaError> {
        channelRepository.getChannels()
            .map { channels in
                channels.sorted { $0.id < $1.id }
            }
            .eraseToAnyPublisher()
    }
}
