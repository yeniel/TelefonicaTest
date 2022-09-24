//
//  MainCoordinator.swift
//  
//
//  Created by Yeniel Landestoy on 24/9/22.
//

import Foundation
import Stinsen
import SwiftUI

final class MainCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.start)

    lazy var routerStorable: MainCoordinator = self

    @Root
    var start = makeStart

    @Route(.push)
    var liveProgram = makeLiveProgramView

    @ViewBuilder
    func makeStart() -> some View {
        ChannelListView()
    }

    @ViewBuilder
    func makeLiveProgramView(id: Int) -> some View {
        let viewModel = LiveProgramViewModel(liveProgramId: id)

        LiveProgramView(viewModel: viewModel)
    }
}
