//
//  ChannelUiModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation

struct ChannelUiModel: Identifiable {
    var id: Int
    let name: String
    let logo: URL?
    let liveProgramName: String
    let liveProgramProgress: Double
}
