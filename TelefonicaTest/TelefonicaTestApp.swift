//
//  TelefonicaTestApp.swift
//  TelefonicaTest
//
//  Created by Yeniel Landestoy on 23/9/22.
//

import SwiftUI

@main
struct TelefonicaTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
