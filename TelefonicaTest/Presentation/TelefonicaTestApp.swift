//
//  TelefonicaTestApp.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import SwiftUI
import Stinsen

@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            TelefonicaTestApp.main()
        } else {
            TestApp.main()
        }
    }
}

struct TelefonicaTestApp: App {
    @SceneBuilder
    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}
