//
//  calculatorBrain.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 08.11.2021..
//

import Foundation

class CalculatorBrain: ObservableObject {
    
    var heightInMeters = Double()
    var weightInKilograms = Double()
    @Published var bmi = Double()
    
    func calculateBMI(_ height: Double, _ weight: Double, _ isMetric: Bool) {
        if isMetric {
            heightInMeters = height / 100
            weightInKilograms = weight
        } else {
            heightInMeters = height / 3.281
            weightInKilograms = weight / 2.205
        }
        
        bmi = weightInKilograms / (heightInMeters * heightInMeters)
    }
}

