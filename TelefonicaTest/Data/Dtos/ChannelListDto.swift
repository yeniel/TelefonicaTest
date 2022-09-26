//
//  ChannelListDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct ChannelListDto: Codable, Equatable {
    let channels: [ChannelDto]

    static func == (lhs: ChannelListDto, rhs: ChannelListDto) -> Bool {
        lhs.channels == rhs.channels
    }
}
