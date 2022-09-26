//
//  ChannelDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct ChannelDto: Codable, Equatable {
    let id: Int
    let logo: String
    let name: String
    let channelLiveProgram: ChannelLiveProgramDto

    enum CodingKeys: String, CodingKey {
        case id
        case logo
        case name
        case channelLiveProgram = "live_program"
    }

    static func == (lhs: ChannelDto, rhs: ChannelDto) -> Bool {
        lhs.id == rhs.id
            && lhs.logo == rhs.logo
            && lhs.name == rhs.name
            && lhs.channelLiveProgram == rhs.channelLiveProgram
    }
}
