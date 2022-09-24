//
//  ChannelUiModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct ChannelUIModel: Identifiable {
    var id: Int
    let name: String
    let logo: URL?
    let liveProgramId: Int
    let liveProgramTitle: String
    let liveProgramProgress: Double
}
