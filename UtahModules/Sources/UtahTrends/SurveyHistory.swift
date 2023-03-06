//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//
// swiftlint:disable identifier_name

import Foundation

struct SurveyHistory: Hashable, Codable, Identifiable {
    var id: Int
    var surveyName: String
    var date: String
    var question1: String
    var question2: String
}
