//
//  ClockService.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

protocol ClockService {
    var currentTime: AnyPublisher<Date, TelefonicaError> { get }
}

class ClockServiceImpl: ClockService {
    @Injected(Container.urlSessionApiClient)
    private var apiClient: ApiClient

    private var cachedCurrentTime: Date?

    var currentTime: AnyPublisher<Date, TelefonicaError> {
        if let currentTime = cachedCurrentTime {
            return Just(currentTime).setFailureType(to: TelefonicaError.self).eraseToAnyPublisher()
        } else {
            return (apiClient.getAll(path: "f5552c061b8cf68cffa0") as AnyPublisher<CurrentTimeDto, TelefonicaError>)
                .map {
                    let currentTime = Date(timeIntervalSince1970: TimeInterval($0.currentTime / 1000))
                    self.cachedCurrentTime = currentTime
                    return currentTime
                }
                .eraseToAnyPublisher()
        }
    }
}
