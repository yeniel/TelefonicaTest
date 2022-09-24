//
//  AppCoordinator.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import Foundation
import Stinsen
import Factory
import SwiftUI

final class AppCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AppCoordinator.start)

    lazy var routerStorable: AppCoordinator = self

    @Root
    var start = makeStart

    @ViewBuilder
    func makeStart() -> some View {
        ChannelListView()
    }
}
