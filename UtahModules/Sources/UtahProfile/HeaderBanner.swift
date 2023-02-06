//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/6/23.
//

import SwiftUI

struct Header: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            Image("jiahui")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct Header_Preview: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
