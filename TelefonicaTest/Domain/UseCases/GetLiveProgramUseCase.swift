//
//  GetLiveProgramUseCase.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

struct GetLiveProgramUseCase {
    @Injected(Container.liveProgramRepository)
    private var liveProgramRepository

    func execute(id: Int) -> AnyPublisher<LiveProgram, TelefonicaError> {
        if id == 24677 {
            return liveProgramRepository.getLiveProgram(id: id)
        } else {
            return Fail(error: TelefonicaError.liveProgramNotFound).eraseToAnyPublisher()
        }
    }
}
