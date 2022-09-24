//
//  ChannelDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct ChannelDto: Codable {
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
}
