//
//  LiveProgramDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct LiveProgramDto: Codable, Equatable {
    let id: Int
    let title: String
    let cover: String
    let category: String
    let description: String
    let start: String
    let end: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case cover
        case category
        case start = "start_time"
        case end = "end_time"
        case description
    }

    static func == (lhs: LiveProgramDto, rhs: LiveProgramDto) -> Bool {
        lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.cover == rhs.cover
            && lhs.category == rhs.category
            && lhs.description == rhs.description
            && lhs.start == rhs.start
            && lhs.end == rhs.end
    }
}
