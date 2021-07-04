//
//  StudyAppApp.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/16/21.
//

import SwiftUI

@main
struct StudyAppApp: App {
    @StateObject var spotifyController = SpotifyController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(spotifyController)
                        .onOpenURL { url in
                            spotifyController.setAccessToken(from: url)
                        }
            
//                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
//                            spotifyController.connect()
//                        })
        }
    }
}
