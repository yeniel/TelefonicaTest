//
//  ChannelRepository.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Combine
import Factory
import Foundation

protocol ChannelRepository {
    func getChannels() -> AnyPublisher<[Channel], TelefonicaError>
}

struct ChannelRepositoryImpl: ChannelRepository {
    @Injected(Container.channelApiDataSource)
    private var apiDataSource: ChannelDataSource

    @Injected(Container.dtoMapper)
    private var dtoMapper: DtoMapper

    func getChannels() -> AnyPublisher<[Channel], TelefonicaError> {
        apiDataSource.getChannels()
            .map { dtoMapper.channelListDtoToChannelList(dto: $0) }
            .eraseToAnyPublisher()
    }
}
