//
//  Timer.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 1/20/21.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        self.secondsLeft = minutes
    }
    func start() {
        self.timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {
            timer in
            if self.secondsLeft == 0 {
                self.reset()
             }
            self.secondsLeft -= 1
        })
        
    }
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    func reset() {
        self.timerMode = .initial
        secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func resume() {
        self.setTimerLength(minutes: self.secondsLeft)
        self.timerMode = .running
        self.start()
    }

}

enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds: Int) -> String{
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minutesTimeStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondsTimeStamp = seconds.count > 1 ? seconds : "0" + seconds

    return "\(minutesTimeStamp) : \(secondsTimeStamp)"
    
}
