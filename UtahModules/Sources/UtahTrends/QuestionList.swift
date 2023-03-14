//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
import Foundation

struct QuestionList: Hashable, Codable {
    var questionID: String
    var questionDescription: String
    var answer: String
}
