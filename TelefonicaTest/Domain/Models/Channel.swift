//
//  Channel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct Channel: Identifiable {
    let id: Int
    var logo: URL?
    let name: String
    let liveProgram: LiveProgram
}
