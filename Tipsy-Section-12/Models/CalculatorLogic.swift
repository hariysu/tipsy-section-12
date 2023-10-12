//
//  CalculatorLogic.swift
//  Tipsy-Section-12
//
//  Created by Abdurahman on 11.10.2023.
//

import Foundation

struct CalculatorLogic {
    var chosenPercentage: String = "10%"
    var peopleCount: String = "2"
    
    func calculate(billText: String)->String {
        // Calculation of tip
        let chosenTip = (Float(chosenPercentage.dropLast(1)) ?? 0) / 100
        // Calculation of numerator
        let totalValue = Float(billText)! * (1 + chosenTip)
        // numerator / denominator
        let result = String(format: "%.2f", totalValue / Float(peopleCount )!)
        return result
    }
}
