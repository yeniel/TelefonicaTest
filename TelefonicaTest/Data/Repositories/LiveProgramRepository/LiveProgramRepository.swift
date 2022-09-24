//
//  LiveProgramRepository.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

protocol LiveProgramRepository {
    func getLiveProgram(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError>
}

struct LiveProgramRepositoryImpl: LiveProgramRepository {
    @Injected(Container.liveProgramApiDataSource)
    private var apiDataSource: LiveProgramDataSource

    @Injected(Container.dtoMapper)
    private var dtoMapper: DtoMapper

    func getLiveProgram(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError> {
        apiDataSource.getLiveProgram(id: id)
            .map { dtoMapper.liveProgramDtoToLiveProgram(dto: $0) }
            .eraseToAnyPublisher()
    }
}
