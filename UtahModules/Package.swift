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
        .library(name: "UtahMockDataStorageProvider", targets: ["UtahMockDataStorageProvider"]),
        .library(name: "UtahOnboardingFlow", targets: ["UtahOnboardingFlow"]),
        .library(name: "UtahProfile", targets: ["UtahProfile"]),
        .library(name: "UtahSchedule", targets: ["UtahSchedule"]),
        .library(name: "UtahSharedContext", targets: ["UtahSharedContext"]),
        .library(name: "UtahTrends", targets: ["UtahTrends"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordBDHG/CardinalKit.git", .upToNextMinor(from: "0.2.1"))
    ],
    targets: [
        .target(
            name: "UtahMockDataStorageProvider",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .product(name: "CardinalKit", package: "CardinalKit"),
                .product(name: "FHIR", package: "CardinalKit")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "UtahOnboardingFlow",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .product(name: "FHIR", package: "CardinalKit"),
                .product(name: "HealthKitDataSource", package: "CardinalKit"),
                .product(name: "Onboarding", package: "CardinalKit")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "UtahProfile",
            dependencies: [
                .target(name: "UtahSharedContext")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "UtahSchedule",
            dependencies: [
                .target(name: "UtahSharedContext"),
                .product(name: "FHIR", package: "CardinalKit"),
                .product(name: "Questionnaires", package: "CardinalKit"),
                .product(name: "Scheduler", package: "CardinalKit")
            ]
        ),
        .target(
            name: "UtahSharedContext",
            dependencies: []
        ),
        .target(
            name: "UtahTrends",
            dependencies: [
                .target(name: "UtahSharedContext")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
