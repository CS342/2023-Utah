// swift-tools-version: 5.7

//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "UtahModules",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "UtahOnboardingFlow", targets: ["UtahOnboardingFlow"]),
        .library(name: "UtahProfile", targets: ["UtahProfile"]),
        .library(name: "UtahSchedule", targets: ["UtahSchedule"]),
        .library(name: "UtahSharedContext", targets: ["UtahSharedContext"]),
        .library(name: "UtahTrends", targets: ["UtahTrends"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.5.0")
    ],
    targets: [
        .target(
            name: "UtahOnboardingFlow",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .target(name: "UtahSchedule")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "UtahProfile",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .target(name: "UtahOnboardingFlow"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]
        ),
        .target(
            name: "UtahSchedule",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]
        ),
        .target(
            name: "UtahSharedContext",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ]
        ),
        .target(
            name: "UtahTrends",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]
        )
    ]
)
