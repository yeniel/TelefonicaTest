//
//  Program.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation

struct Program: Identifiable {
    let id: Int
    let title: String
    var cover: URL?
    let category: ProgramCategory
    var description: String?
}
