//
//  ChannelLiveProgramDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct ChannelLiveProgramDto: Codable {
    let id: Int
    let title: String
    let start: String
    let end: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case start = "start_time"
        case end = "end_time"
    }
}
