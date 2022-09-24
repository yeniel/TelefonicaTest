//
//  TelefonicaTestApp.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import SwiftUI
import Stinsen

@main
struct TelefonicaTestApp: App {
    @SceneBuilder
    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
    }
}
