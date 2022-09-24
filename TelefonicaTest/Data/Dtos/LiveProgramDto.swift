//
//  LiveProgramDto.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct LiveProgramDto: Codable {
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
}
