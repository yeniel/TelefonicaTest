//
//  GetCurrentTimeUseCase.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

struct GetCurrentTimeUseCase {
    @Injected(Container.clockService)
    private var clockService

    func execute() -> AnyPublisher<Date, TelefonicaError> {
        clockService.currentTime
    }
}
