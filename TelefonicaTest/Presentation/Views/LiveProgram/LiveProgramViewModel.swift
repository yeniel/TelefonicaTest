//
//  LiveProgramViewModel.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Combine
import Factory
import Foundation
import Stinsen

class LiveProgramViewModel: ObservableObject {
    @Published
    var status: ScreenStatus = .loading

    @Published
    var liveProgram: LiveProgramUIModel = .empty

    @Injected(Container.getLiveProgramUseCase)
    private var getLiveProgramUseCase: GetLiveProgramUseCase

    @Injected(Container.getCurrentTimeUseCase)
    private var getCurrentTimeUseCase: GetCurrentTimeUseCase

    @Injected(Container.uiModelMapper)
    private var uiModelMapper: UIModelMapper

    private let liveProgramId: Int
    private var cancellables = Set<AnyCancellable>()

    init(liveProgramId: Int) {
        self.liveProgramId = liveProgramId
        getLiveProgramUseCase.execute(id: liveProgramId)
            .combineLatest(getCurrentTimeUseCase.execute())
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { liveProgram, currentTime in
                    self.liveProgram = self.uiModelMapper.mapLiveProgramToLiveProgramUIModel(
                        liveProgram: liveProgram,
                        currentTime: currentTime
                    )
                    self.status = .loaded
                }
            )
            .store(in: &cancellables)
    }
}
