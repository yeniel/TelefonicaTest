//
//  LiveProgramApiDataSource.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine
import Factory

struct LiveProgramApiDataSource: LiveProgramDataSource {
    @Injected(Container.urlSessionApiClient)
    private var apiClient: ApiClient

    func getLiveProgram(id: Int) -> AnyPublisher<LiveProgramDto, TelefonicaError> {
        // In a real Api maybe we should pass the program id as path,
        // but for this example I hard coded it
        // ej. apiClient.getAll(path: "programs/\(id)")
        apiClient.get(path: "f3c6446abeb1c5a82079")
    }
}
