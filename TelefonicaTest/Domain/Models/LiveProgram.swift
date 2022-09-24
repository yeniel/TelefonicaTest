//
//  LiveProgram.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct LiveProgram: Equatable {
    let program: Program
    let start: Date
    let end: Date

    static func == (lhs: LiveProgram, rhs: LiveProgram) -> Bool {
        lhs.program == rhs.program
            && lhs.start == rhs.start
            && lhs.end == rhs.end
    }
}
