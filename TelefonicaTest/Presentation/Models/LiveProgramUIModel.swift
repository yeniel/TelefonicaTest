//
//  LiveProgramUIModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct LiveProgramUIModel: Identifiable {
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
}
