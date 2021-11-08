//
//  calculatorBrain.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 08.11.2021..
//

import Foundation

class CalculatorBrain: ObservableObject {
    
    @Published var bmi = Double()
    
    func calculateBMI(_ height: Double, _ weight: Double) {
        let heightInMeters = height / 100
        bmi = weight / (heightInMeters * heightInMeters)
    }
}

