//
//  ImageProgressView.swift
//  StudyApp
//
//  Created by Aina Phakhruddin on 2/2/21.
//

import SwiftUI

struct ImageProgressView: View {
    @ObservedObject var studyTimer = TimerManager()
    var body: some View {
        
        let percentElapsed = Double(studyTimer.secondsLeft / studyTimer.totalTimeinSeconds)
        
        VStack {
            Text("percent: \(percentElapsed)")
            Text("seconds Left: \(studyTimer.secondsLeft)")
            Text("seconds Total: \(studyTimer.totalTimeinSeconds)")
        }
//        if (percentElapsed > 0.9) {
//            Image("crane_step8")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.8) {
//            Image("crane_step7")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.7) {
//            Image("crane_step6")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.6) {
//            Image("crane_step5")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.5) {
//            Image("crane_step4")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.4) {
//            Image("crane_step3")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else if (percentElapsed > 0.3) {
//            Image("crane_step2")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        else {
//            Image("crane_step1")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        Image("paper_crane")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
    }
}

struct ImageProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProgressView()
    }
}
