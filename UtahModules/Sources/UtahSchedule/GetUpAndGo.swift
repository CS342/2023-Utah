//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import UtahSharedContext
import UIKit


struct GetUpAndGo: View {
    @State private var primaryActionLoading = false
    private var _primaryAction = {print("hi")}
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.systemGroupedBackground).ignoresSafeArea()
                VStack() {
                    VStack(alignment: .center) {
                        Text("GET_UP_AND_GO_DESCRIPTION", bundle: .module)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 36)
                            .padding(.vertical)
                            .bold()
                        Text("GET_UP_AND_GO_WARNING", bundle: .module)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 36)
                            .italic()
                    }
                    Divider().frame(height: 1.5).background(Color(.systemGroupedBackground)).padding(.horizontal, 20)
                    Spacer().frame(maxHeight: 80)
                    Button(action: primaryAction) {
                        Group {
                            if primaryActionLoading {
                                ProgressView()
                            } else {
                                Text(String(localized: "GET_UP_AND_GO_START_BUTTON", bundle: .module))
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 38)
                    }
                    .padding(.horizontal, 36)
                    .padding(.bottom, 16)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(.systemGreen))
                }.background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(.systemBackground))
                        .padding(.horizontal, 20)
                    
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                ).padding(.top, 26)
            }.navigationTitle("Edmonton Frail Scale")
        }
        
    }
    
    private func primaryAction() {
            withAnimation(.easeOut(duration: 0.2)) {
                primaryActionLoading = true
            }
            _primaryAction()
            withAnimation(.easeIn(duration: 0.2)) {
                primaryActionLoading = false
            }
    }
}

#if !TESTING
struct GetUpAndGo_Previews: PreviewProvider {
    static var previews: some View {
        GetUpAndGo()
    }
}
#endif
