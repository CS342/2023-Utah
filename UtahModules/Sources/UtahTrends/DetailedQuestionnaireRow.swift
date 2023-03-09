//
//  SwiftUIView.swift
//  
//
//  Created by Audrey Lin on 3/6/23.
//

import SwiftUI

struct DQRowView: View {
    // questions and answers in same array
    
    // turn this into dictionary: q1:"Drawing Clock Test"
    var questionList = ["q1":"Drawing Clock Test", "q2":"Times admitted to a hospital the past year", "q3":"Description of overall health"]
    @State var answerList = [QuestionList]()
    var body: some View {
        ScrollView {
            ForEach(answerList, id:\.self) { item in
                Text(item.questionDescription)
                    .padding(.all, 10)
                    .background(Rectangle().fill(Color.accentColor).shadow(radius: 3)
                        .cornerRadius(15)
                    )
                    .foregroundColor(.white)
                
                Spacer()
                Text(item.answer)
            }
            .font(.title)
            // call fn that returns this answer list - calls out to firebase, grabs all answers and returns tis list
        }.onAppear(perform: {answerList = [QuestionList(questionID: "q1", questionDescription: questionList["q1"] ?? "", answer: "yes"), QuestionList(questionID: "q2", questionDescription: questionList["q2"] ?? "", answer: "yes"), QuestionList(questionID: "q3", questionDescription: questionList["q3"] ?? "", answer: "yes")]})
    }
}

struct DQRowView_Previews: PreviewProvider {
    static var previews: some View {
        DQRowView()//question: questions[0])
    }
}
