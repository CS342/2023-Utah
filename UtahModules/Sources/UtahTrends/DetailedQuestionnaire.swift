//
//  SwiftUIView.swift
//  
//
//  Created by Audrey Lin on 3/5/23.
//

import SwiftUI

struct DetailedQuestionnaireView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            ScrollView {
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
            }
            .font(.title)
        }
    }
    
    struct DetailedQuestionnaireView_Previews: PreviewProvider {
        static var previews: some View {
            DetailedQuestionnaireView()
        }
    }
}
