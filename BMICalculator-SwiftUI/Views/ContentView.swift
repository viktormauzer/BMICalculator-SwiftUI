//
//  ContentView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 12.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var height = 140.0
    @State private var weight = 85.0
    @State private var showModal = false
    
    @ObservedObject var calculatorBrain = CalculatorBrain()
    
    var body: some View {
        ZStack {
            Image("BMICalculatorBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            Image("BMICalculatorLogo")
                .offset(y: -50)
            VStack {
                Spacer()
                
                
                SliderWithLabel(value: $height, unit: "cm", range: 50...230)
                SliderWithLabel(value: $weight, unit: "kg", range: 20...150)
                
                BMIButton(buttonText: "CALCULATE", buttonColor: "BMIPurple") {
                    calculatorBrain.calculateBMI(height, weight)
                    showModal = true
                }
                .sheet(isPresented: $showModal, onDismiss: nil) {
                    ResultsView(bmi: calculatorBrain.bmi, isPresented: $showModal)
                }
            }
            .padding(.horizontal, 15.0)
            .padding(.bottom, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
