//
//  ContentView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 12.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var height = 0.0
    @State private var weight = 0.0
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
                
                Text("\(String(format: "%.0f", height)) cm")
                Slider(value: $height, in: 60...250)
                
                Text("\(String(format: "%.0f", weight)) kg")
                Slider(value: $weight, in: 20...130)
                
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
