//
//  ProgramProgressView.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation
import SwiftUI

struct ProgramProgressView: View {
    let progress: Double

    var body: some View {
        ProgressView(value: progress)
            .tint(Color.blue)
    }
}
