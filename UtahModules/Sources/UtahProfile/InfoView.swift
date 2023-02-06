//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/6/23.
//

import SwiftUI

struct Field: Identifiable {
    let id = UUID()
    var title: String
    var value: String
    var image: String
 }


struct InfoView: View {
    var fields = [
        Field(title: "Email", value: "jchen23@stanford.edu", image: "mail"),
        Field(title: "Phone", value: "6504208566", image: "phone"),
        Field(title: "Address", value: "1047 Campus Drive, CA", image: "house")
    ]

    var body: some View {
        List {
            ForEach(fields) { field in
                InfoRowView(title: field.title, value: field.value, image: field.image)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
