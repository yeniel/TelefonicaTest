//
//  ChannelApiDataSource.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

struct ChannelApiDataSource: ChannelDataSource {
    @Injected(Container.urlSessionApiClient)
    private var apiClient: ApiClient

    func getChannels() -> AnyPublisher<ChannelListDto, TelefonicaError> {
        // In a real Api maybe we should pass the channels path,
        // but for this example I hard coded it
        // ej. apiClient.getAll(path: "channels")
        apiClient.get(path: "f5552c061b8cf68cffa0")
    }
}
