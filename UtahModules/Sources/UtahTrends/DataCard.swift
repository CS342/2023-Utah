//
//  DataCard.swift
//  
//
//  Created by Jennifer Xu on 2/5/23.
//

import SwiftUI

struct DataCard: View {
    let icon: String
    let title: String
    let unit: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline){
                Image(systemName: icon)
                Text(title)
                    .font(.headline)
            }
            .padding(.bottom, 2)
            HStack(alignment: .firstTextBaseline){
                Text("500")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                Text(unit)
            }

        }
        .padding(.trailing, 150)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(.systemBackground))
                .shadow(radius: 5)
                .frame(width: 350, height: 100)
        }
        
        
    }
}

struct DataCard_Previews: PreviewProvider {
    static var previews: some View {
        DataCard(icon: "shoeprints.fill", title: "Daily Step Count", unit: "steps")
    }
}