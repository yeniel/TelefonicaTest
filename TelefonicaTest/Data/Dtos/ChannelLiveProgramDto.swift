//
//  ChannelLiveProgramDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct ChannelLiveProgramDto: Codable, Equatable {
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

    static func == (lhs: ChannelLiveProgramDto, rhs: ChannelLiveProgramDto) -> Bool {
        lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.start == rhs.start
            && lhs.end == rhs.end
    }
}
