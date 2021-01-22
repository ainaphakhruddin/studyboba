//
//  ContentView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            
            CalendarView()
            .tabItem {
                Image(systemName: "calendar")
            }
            
            TimerView()
            .tabItem {
                Image(systemName: "deskclock")
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
