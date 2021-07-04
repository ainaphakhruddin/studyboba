//
//  SetTimerView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/20/21.
//

import SwiftUI

struct SetTimerView: View {
    @ObservedObject var studyTimer = TimerManager()
    @EnvironmentObject var spotifyController: SpotifyController
    @State private var showingPicker = false
    @State var selectedTimePicker = 0
    let availableMinutes = Array(0...59)
    func setStudyTimer()
    {
        if self.studyTimer.timerMode == .initial {
           self.studyTimer.setTimerLength(minutes: self.availableMinutes[self.selectedTimePicker]*60)
        }
    }
      
    var body: some View {
        //MARK: IconView
        NavigationView {
            VStack{
                Image("paper_crane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Duration")
                    .font(.title)
                HStack {
                    Text(secondsToMinutesAndSeconds(seconds: studyTimer.secondsLeft))
                        .font(.largeTitle)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .onChange(of: selectedTimePicker) { newValue in
                            if self.studyTimer.timerMode == .initial {
                                self.studyTimer.setTimerLength(minutes: self.availableMinutes[newValue]*60)
                            }
                    }
                    
                    Button(action: {
                        self.showingPicker.toggle()
                    }, label: {
                        Image(systemName: self.showingPicker ? "chevron.up.circle" : "chevron.down.circle")
                    })
                }

                if self.showingPicker {
                    if studyTimer.timerMode == .initial {
                            Picker(selection: $selectedTimePicker, label: Text("")){
                                ForEach(0..<availableMinutes.count)
                                {min in
                                    if min % 5 == 0 && min != 0 {
                                        Text("\(min) : 00")
                                    }
                                }
                            }.pickerStyle(WheelPickerStyle())
                    }
                }

                HStack(spacing:25) {
                    
                //TODO: tapping tag allows to choose subject/goal
                Image(systemName: "tag")
                
                NavigationLink(destination: TimerView()) {
                    Text("start")
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color.gray)
                                .opacity(0.75)
                        )

                }
                
               
                //TODO: tapping music open options to spotify or apple music
                Image(systemName: "music.note.house")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .onTapGesture(perform: {
                        spotifyController.connect()
                    })
                }
               
                
                

            }
            
        }
    }
  
}


struct SetTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SetTimerView()
    }
}
