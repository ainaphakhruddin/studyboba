//
//  ContentView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/16/21.
//
import SwiftUI

struct ContentView: View {
    //ui will be updated based on the state of the timer

    @ObservedObject var studyTimer = TimerManager()
    @State private var timerRunning = false
    @EnvironmentObject var spotifyController: SpotifyController
    var body: some View {
        TabView {
            
            CalendarView()
            .tabItem {
                Image(systemName: "calendar")
            }
            if studyTimer.timerMode == .initial {
                SetTimerView()
                .environmentObject(spotifyController)
                .tabItem {
                    Image(systemName: "deskclock")
                }
                
            }
            
            ProfileView()
            .tabItem {
                Image(systemName: "person.fill")
            }
        }


        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
