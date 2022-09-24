//
//  Factory.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Factory

extension Container {
    // MARK: Repositories

    static let channelRepository = Factory { ChannelRepositoryImpl() as ChannelRepository }
    static let channelApiDataSource = Factory { ChannelApiDataSource() as ChannelDataSource }

    static let liveProgramRepository = Factory { LiveProgramRepositoryImpl() as LiveProgramRepository }
    static let liveProgramApiDataSource = Factory { LiveProgramApiDataSource() as LiveProgramDataSource }

    static let clockService = Factory { ClockServiceImpl() as ClockService }
    static let urlSessionApiClient = Factory { UrlSessionApiClient() as ApiClient }

    // MARK: Mappers

    static let dtoMapper = Factory { DtoMapper() }
    static let uiModelMapper = Factory { UIModelMapper() }

    // MARK: Use Cases

    static let getChannelsUseCase = Factory { GetChannelsUseCase() }
    static let getLiveProgramUseCase = Factory { GetLiveProgramUseCase() }
    static let getCurrentTimeUseCase = Factory { GetCurrentTimeUseCase() }
    static let isProgramAvailableUseCase = Factory { IsProgramAvailableUseCase() }

    // MARK: Managers, helpers

}
