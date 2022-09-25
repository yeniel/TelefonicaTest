//
//  ChannelListView.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Combine
import Factory
import Foundation
import SwiftUI

// swiftlint:disable switch_case_alignment

struct ChannelListView: View {
    @ObservedObject
    var viewModel: ChannelListViewModel

    init(viewModel: ChannelListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        switch viewModel.status {
            case .loading:
                VStack {
                    ProgressView()
                }
            case .loaded:
                List {
                    ForEach(viewModel.channelList) { channel in
                        ChannelCell(
                            channel: channel,
                            action: { viewModel.routeToProgram(id: channel.liveProgramId) }
                        )
                    }
                }
                .alert("Unknown Error", isPresented: $viewModel.showError) {
                    Button("OK", role: .cancel) { }
                }
        }
    }
}

struct ChannelCell: View {
    let channel: ChannelUIModel
    let action: () -> Void

    var body: some View {
        HStack {
            AsyncImage(url: channel.logo) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(systemName: "photo.tv")
                }
            }
            .frame(width: 130, height: 75)
            VStack(alignment: .leading) {
                Text(channel.name)
                    .font(.callout)
                    .fontWeight(.bold)
                Text(channel.liveProgramTitle)
                    .font(.caption)
                ProgramProgressView(progress: channel.liveProgramProgress)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}
