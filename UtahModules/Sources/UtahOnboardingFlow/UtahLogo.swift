//
//  SwiftUIView.swift
//  
//
//  Created by Brooke Krajancich on 3/8/23.
//

// swiftlint:disable accessibility_label_for_image

import SwiftUI

public var utahLogo: Image {
    guard let imagePath = Bundle.module.path(forResource: "UtahLogo", ofType: "jpeg"),
       let image = UIImage(contentsOfFile: imagePath) else {
        return Image(systemName: "building.columns.fill")
    }

    return Image(uiImage: image)
}
