//
//  ChannelUiModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct ChannelUIModel: Identifiable, Equatable {
    var id: Int
    let name: String
    let logo: URL?
    let liveProgramId: Int
    let liveProgramTitle: String
    let liveProgramProgress: Double

    static func == (lhs: ChannelUIModel, rhs: ChannelUIModel) -> Bool {
        lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.logo == rhs.logo
            && lhs.liveProgramId == rhs.liveProgramId
            && lhs.liveProgramTitle == rhs.liveProgramTitle
            && lhs.liveProgramProgress == rhs.liveProgramProgress
    }
}
