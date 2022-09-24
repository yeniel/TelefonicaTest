//
//  LiveProgramView.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Combine
import Factory
import Foundation
import SwiftUI

// swiftlint:disable switch_case_alignment

struct LiveProgramView: View {
    @ObservedObject
    var viewModel: LiveProgramViewModel

    init(viewModel: LiveProgramViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            switch viewModel.status {
                case .loading:
                    ProgressView()
                case .loaded:
                    AsyncImage(url: viewModel.liveProgram.cover) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if phase.error != nil {
                            Image(systemName: "photo.tv")
                        } else {
                            ProgressView()
                        }
                    }
                    Text(viewModel.liveProgram.title)
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.leading, 8)
                        .padding(.bottom, 8)
                    Text(viewModel.liveProgram.description)
                        .font(.caption)
                    HStack {
                        Text(viewModel.liveProgram.start)
                            .padding(.trailing, 8)
                        ProgramProgressView(progress: viewModel.liveProgram.progress)
                        Text(viewModel.liveProgram.end)
                            .padding(.leading, 8)
                    }
                    .padding()
                    Spacer()
            }
        }
    }
}
