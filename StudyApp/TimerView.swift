//
//  TimerView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/17/21.
//

import SwiftUI

struct TimerView: View {
    //ui will be updated baed on the state of the timer
    @ObservedObject var studyTimer = TimerManager()

    @State private var timeRemaining = 15
    @State private var isActive = true //is the app active?
        
    var body: some View {
        VStack {
            Spacer()
            //MARK: TimerView
            Text(secondsToMinutesAndSeconds(seconds: studyTimer.secondsLeft))
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )

            
            
            //MARK: MotivationView
            Text("Effort won’t betray you")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            //MARK: IconView

            VStack {
                ImageProgressView(studyTimer: studyTimer)
            }
//            .onReceive(studyTimer) {_ in
//                let time = Double(studyTimer.secondsLeft / studyTimer.totalTimeinSeconds)
//            }

            //MARK: LinkView
            Text("open spotify")
            
            Text(studyTimer.timerMode == .running ? "pause" : "resume")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )
                .onTapGesture {
                    if (studyTimer.timerMode == .running) {
                        studyTimer.pause()
                    }
                    else {
                        studyTimer.resume()
                    }
                    
                }
            

            
            Spacer()
        }
        .onAppear(){
            self.studyTimer.start()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
            studyTimer.pause()
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.isActive = true
            studyTimer.resume()
            
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
