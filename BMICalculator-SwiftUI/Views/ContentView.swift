//
//  ContentView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 12.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var isMetric = true
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
                
                HStack {
                    Text("Imperial")
                        .foregroundColor(.white)
                    Toggle(isOn: $isMetric) {
                        Text("Units")
                            .font(.headline)
                    }
                    .labelsHidden()
                    Text("Metric")
                        .foregroundColor(.white)
                }
                .padding(.all, 25.0)
                .frame(width: 250, height: 50, alignment: .center)
                .background(Color("BMIBlue"))
                .cornerRadius(100)
                .padding(.bottom, 100.0)
                
                
                SliderWithLabel(
                    value: $height,
                    unit: isMetric ? "cm" : "feet",
                    range: isMetric ? 50...230 : 2...8)
                SliderWithLabel(
                    value: $weight,
                    unit: isMetric ? "kg" : "pounds",
                    range: isMetric ? 50...150 : 80...400)
                
                BMIButton(buttonText: "CALCULATE", buttonColor: "BMIPurple") {
                    calculatorBrain.calculateBMI(height, weight, isMetric)
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
