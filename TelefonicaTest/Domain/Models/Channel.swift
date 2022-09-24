//
//  Channel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct Channel: Equatable, Identifiable {
    let id: Int
    var logo: URL?
    let name: String
    let liveProgram: LiveProgram

    static func == (lhs: Channel, rhs: Channel) -> Bool {
        lhs.id == rhs.id
            && lhs.logo == rhs.logo
            && lhs.name == rhs.name
            && lhs.liveProgram == rhs.liveProgram
    }
}
