//
//  UrlSessionApiClient.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine

struct UrlSessionApiClient: ApiClient {
    static let host = "https://api.npoint.io"
    let decoder: JSONDecoder = .init()

    func get<T: Decodable>(path: String) -> AnyPublisher<T, TelefonicaError> {
        URLSession.shared
            .dataTaskPublisher(for: configureUrlRequest(path: path))
            .tryMap { result -> T in
                try self.decoder.decode(T.self, from: result.data)
            }
            .mapError { _ -> TelefonicaError in
                // Here we can map the UrlSessionApiClient specific errors
                // to domain errors TelefonicaError.
                // For now we don't have any specification of the api errors
                TelefonicaError.networkError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func configureUrlRequest(path: String, method: HttpMethod = .GET) -> URLRequest {
        let url = URL(string: "\(UrlSessionApiClient.host)/\(path)")
        var request = URLRequest(url: url!)

        request.httpMethod = method.rawValue
        request.addValue("application/json; charset=iso-8859-1", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}

enum HttpMethod: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}
