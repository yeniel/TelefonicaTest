//
//  ChannelListViewModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Combine
import Factory
import Foundation
import Stinsen

class ChannelListViewModel: ObservableObject {
    @Published
    var status: ScreenStatus = .loading

    @Published
    var channelList: [ChannelUiModel] = []

    @Injected(Container.getChannelsUseCase)
    private var getChannelsUseCase: GetChannelsUseCase

    @Injected(Container.getCurrentTimeUseCase)
    private var getCurrentTimeUseCase: GetCurrentTimeUseCase

    @Injected(Container.uiModelMapper)
    private var uiModelMapper: UiModelMapper

    private var cancellables = Set<AnyCancellable>()

    init() {
        getChannelsUseCase.execute().combineLatest(getCurrentTimeUseCase.execute())
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { channels, currentTime in
                    self.channelList = channels.map {
                        self.uiModelMapper.mapChannelToChannelUiModel(
                            channel: $0,
                            currentTime: currentTime
                        )
                    }
                    self.status = .loaded
                }
            )
            .store(in: &cancellables)
    }

    func channelTapped(channel _: ChannelUiModel) {
    }
}

enum ScreenStatus {
    case loading
    case loaded
}
