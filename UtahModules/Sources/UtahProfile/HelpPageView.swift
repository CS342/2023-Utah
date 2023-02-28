//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/27/23.
//

import SwiftUI

struct HelpPage: View {
    var body: some View {
        Form {
            Section(header: Text("REPORT A PROBLEM")) {
                Text("support@stanford.edu")
            }
            Section(header: Text("SUPPORT")) {
                Link("+1 (801) 587-1450", destination: URL(string: "tel:(+1(801)587-1450)")!)
            }
            Section(header: Text("WITHDRAW FROM STUDY")) {
                Link("+1 (801) 581-8301", destination: URL(string: "tel:(+1(801)-581-8301)")!)
            }
        }
    }
}

struct HelpPageView_Previews: PreviewProvider {
    static var previews: some View {
        HelpPage()
    }
}
