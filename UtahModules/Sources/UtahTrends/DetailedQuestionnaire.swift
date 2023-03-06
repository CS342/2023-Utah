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
                ScrollView {
                    Text("1: " + "Clock Test")
                        .frame(width: 350, height: 500)
                        .background(Rectangle().fill(Color.accentColor).shadow(radius: 3))
                    // add image - will push text up (hopefully
                    Text("2")
                        .foregroundColor(.accentColor)
                    Text("Number of times admitted to a hospital")
                    Text("3")
                    Text("General health rating")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("4")
                    Text("How many routine activities you need help with")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("5")
                    Text("Can you rely on others' support for your needs?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .navigationTitle("[date]" + " Response")
                
                .padding(.bottom, 20)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("back")
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .font(.title)
    }
}

struct DetailedQuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedQuestionnaireView()
    }
}
