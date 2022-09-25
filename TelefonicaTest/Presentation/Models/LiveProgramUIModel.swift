//
//  LiveProgramUIModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct LiveProgramUIModel: Identifiable, Equatable {
    var id: Int
    let cover: URL?
    let title: String
    let description: String
    let start: String
    let end: String
    let progress: Double

    static var empty: LiveProgramUIModel {
        LiveProgramUIModel(
            id: 0,
            cover: nil,
            title: "",
            description: "",
            start: "",
            end: "",
            progress: 0.0
        )
    }

    static func == (lhs: LiveProgramUIModel, rhs: LiveProgramUIModel) -> Bool {
        lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.cover == rhs.cover
            && lhs.description == rhs.description
            && lhs.start == rhs.start
            && lhs.end == rhs.end
            && lhs.progress == rhs.progress
    }
}
