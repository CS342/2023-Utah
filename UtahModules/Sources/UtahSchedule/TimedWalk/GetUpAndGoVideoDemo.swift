//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

// swiftlint:disable force_unwrapping

import AVKit
import SwiftUI

struct GetUpAndGoVideoDemo: View {
    var body: some View {
        Text("Demonstration Below")
            .font(.title)
            .fontWeight(.bold)
        Text("Tap on it to play")
            .padding(.vertical, 20)
        VideoPlayer(
            player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
            // player: AVPlayer(url: Bundle.main.url(forResource: "video", withExtension: "mp4")!)
        )
        .frame(height: 300)
    }
}

struct GetUpAndGoVideoDemo_Previews: PreviewProvider {
    static var previews: some View {
        GetUpAndGoVideoDemo()
    }
}
