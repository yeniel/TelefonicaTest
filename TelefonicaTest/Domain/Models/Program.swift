//
//  Program.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct Program: Equatable, Identifiable {
    let id: Int
    let title: String
    var cover: URL?
    let category: ProgramCategory
    var description: String?

    static func == (lhs: Program, rhs: Program) -> Bool {
        lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.cover == rhs.cover
            && lhs.category == rhs.category
            && lhs.description == rhs.description
    }
}
