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
                Button {
                    showModal = true
                    print(height, weight)
                } label: {
                    Text("CALCULATE")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("BMIPurple"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .sheet(isPresented: $showModal, onDismiss: nil) {
                    ResultsView(height: height, weight: weight, isPresented: $showModal)
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
