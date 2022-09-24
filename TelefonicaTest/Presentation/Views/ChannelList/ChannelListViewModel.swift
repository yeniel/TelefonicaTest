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
    var channelList: [ChannelUIModel] = []

    @Published
    var showError: Bool = false

    @Injected(Container.getChannelsUseCase)
    private var getChannelsUseCase: GetChannelsUseCase

    @Injected(Container.getCurrentTimeUseCase)
    private var getCurrentTimeUseCase: GetCurrentTimeUseCase

    @Injected(Container.isProgramAvailableUseCase)
    private var isProgramAvailableUseCase: IsProgramAvailableUseCase

    @Injected(Container.uiModelMapper)
    private var uiModelMapper: UIModelMapper

    @RouterObject
    var router: MainCoordinator.Router?

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

    func routeToProgram(id: Int) {
        if isProgramAvailableUseCase.execute(programId: id) {
            router?.coordinator.route(to: \.liveProgram, id)
        } else {
            showError = true
        }
    }
}
