//
//  SwiftUIView.swift
//  
//
//  Created by Audrey Lin on 3/6/23.
//

import SwiftUI

struct DQRowView: View {
    //var historyQuestion: SurveyHistory
    var body: some View {
        HStack() {
            Text("1")
                .bold()
            Spacer()
            Text("Clock Test")
                .frame(width: 300, height: 50)
                .background(Rectangle().fill(Color.accentColor).shadow(radius: 3)
                    .cornerRadius(15)
                )
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct DQRowView_Previews: PreviewProvider {
    static var previews: some View {
        DQRowView()//historyQuestion: historyQuestions[0])
    }
}
