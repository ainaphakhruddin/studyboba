//
//  SetTimerView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/20/21.
//

import SwiftUI

struct SetTimerView: View {
    @State var timermode: TimerMode = .initial
    @State var selectedTimePicker = 0
    let availableMinutes = Array(1...59)

    var body: some View {
        //MARK: IconView
        ZStack {
            if timermode == .initial {
                Picker(selection: $selectedTimePicker, label: Text("")){
                    ForEach(0..<availableMinutes.count)
                    {min in
                        Text("\(min) min")

                    }
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
