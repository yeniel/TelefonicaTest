//
//  MainCoordinator.swift
//  
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation
import Stinsen
import SwiftUI

protocol MainCoordinatorProtocol {
    func routeToLiveProgram(id: Int)
}

final class MainCoordinator: MainCoordinatorProtocol, NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.start)

    lazy var routerStorable: MainCoordinator = self

    @Root
    var start = makeStart

    @Route(.push)
    var liveProgram = makeLiveProgramView

    @ViewBuilder
    func makeStart() -> some View {
        let viewModel = ChannelListViewModel(coordinator: self)

        ChannelListView(viewModel: viewModel)
    }

    @ViewBuilder
    func makeLiveProgramView(id: Int) -> some View {
        let viewModel = LiveProgramViewModel(liveProgramId: id)

        LiveProgramView(viewModel: viewModel)
    }

    func routeToLiveProgram(id: Int) {
        route(to: \.liveProgram, id)
    }
}
