//
//  FinalValueEstimator.swift
//  FinanceApp
//
//  Created by Nuwan Mataraarachchi on 2025-03-16.
//

import SwiftUI

struct FinalValueEstimator: View {
    @State private var initialInvestment: String = ""
    @State private var interestRate: String = ""
    @State private var finalValue: String = ""
    @State private var timePeriod: String = ""
    @State private var errorMessage: String = ""

    // Function to calculate investment duration
    func calculateInvestmentDuration() {
        errorMessage = ""

        // Convert the input values to numbers (Double)
        if let P = Double(initialInvestment), let A = Double(finalValue), let r = Double(interestRate), P > 0, A > P {
            // Formula to calculate the duration
            let duration = log(A / P) / log(1 + r / 100)
            timePeriod = String(format: "%.2f", duration) // Format result to 2 decimal places
        } else {
            errorMessage = "Please enter valid numbers."
        }
    }

    var body: some View {
        VStack {
            Text("Investment Duration Calculator")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)

            VStack(spacing: 25) { // Increased spacing between objects
                TextField("Initial Investment", text: $initialInvestment)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(height: 50)
                TextField("Interest Rate (%)", text: $interestRate)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(height: 50)

                TextField("Final Value", text: $finalValue)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(height: 50)
            }
            .frame(maxWidth: 350)
            .padding(.top, 30)

            Button(action: {
                calculateInvestmentDuration()
                // Dismiss the keyboard after calculation
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Calculate Duration")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()

            if !timePeriod.isEmpty {
                Text("It will take \(timePeriod) years to reach the desired value.")
                    .foregroundColor(.green)
                    .padding()
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red) // Error color
                    .padding()
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Center everything vertically and horizontally
    }
}

struct FinalValueEstimator_Previews: PreviewProvider {
    static var previews: some View {
        FinalValueEstimator()
    }
}
