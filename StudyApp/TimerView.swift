//
//  TimerView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/17/21.
//

import SwiftUI

struct TimerView: View {
    //ui will be updated baed on the state of the timer
    @State var timermode: TimerMode = .initial

    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            //MARK: TimerView
            Text("\(timeRemaining)")
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
            Image("Effort won’t betray you")
            
            //MARK: IconView
            ZStack {
                Circle()
                    .foregroundColor(.white)
                Image(systemName: timermode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                if timermode == .initial {
//                    Picker(selection: $selectedTimePicker, label: Text("")){
//                        ForEach(0..<availableMinutes.count)
//                        {min in
//                            Text("\(min) min")
//
//                        }
//                    }
//
//                }
            }
            
            //MARK: LinkView
            Text("open spotify")
            
            Spacer()
        }
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
