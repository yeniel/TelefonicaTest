//
//  ChannelDataSource.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Combine

protocol ChannelDataSource {
    func getChannels() -> AnyPublisher<ChannelListDto, TelefonicaError>
}
