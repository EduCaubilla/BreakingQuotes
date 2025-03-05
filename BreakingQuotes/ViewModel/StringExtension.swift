//
//  StringExtension.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
