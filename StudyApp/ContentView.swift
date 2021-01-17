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
            
            
            VStack {
                //MARK: CalendarView
                Text("calendar")
            }
            .tabItem {
                Image(systemName: "calendar")
            }
            
            VStack {
                Spacer()
                //MARK: TimerView
                Text("00: 00")
                
                //MARK: MotivationView
                Text("Effort won’t betray you")
                
                //MARK: IconView
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image("milk_tea")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                //MARK: LinkView
                Text("open spotify")
                
                Spacer()
            }
            .tabItem {
                Image(systemName: "house")
            }
            
            VStack {
                //MARK: CalendarView
                Text("settings")
            }
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
