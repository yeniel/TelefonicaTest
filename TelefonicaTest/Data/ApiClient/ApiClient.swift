//
//  ApiClient.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine

protocol ApiClient {
    func get<T: Decodable>(path: String) -> AnyPublisher<T, TelefonicaError>
    // Commented because in this small project is not needed yet
//    func post<T>(path: String, data: T) -> AnyPublisher<T, TelefonicaError>
//    func put<T>(path: String, data: T) -> AnyPublisher<T, TelefonicaError>
//    func patch<T>(path: String, data: T) -> AnyPublisher<T, TelefonicaError>
//    func delete<T>(path: String) -> AnyPublisher<T, TelefonicaError>
}
