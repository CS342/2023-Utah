//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//

import Foundation

var surveyHistories: [SurveyHistory] = load("surveyData", withExtension: "json")

func load<T: Decodable>(_ filename: String, withExtension fileExtension: String) -> T {
    let data: Data
    
    guard let file = Bundle.module.url(forResource: filename, withExtension: fileExtension) else {
        fatalError("Couldn't find \"\(filename).\(fileExtension)\" in the module bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
