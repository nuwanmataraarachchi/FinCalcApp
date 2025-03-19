//
//  PresentValueEstimator.swift
//  FinanceApp
//
//  Created by Nuwan Mataraarachchi on 2025-03-16.
//

import SwiftUI

struct PresentValueEstimator: View {
    @State private var futureValue: String = ""
    @State private var interestRate: String = ""
    @State private var timePeriod: String = ""
    @State private var initialInvestment: String = ""
    @State private var errorMessage: String = ""

    // Function to calculate Present Value (PV)
    func calculatePresentValue() {
        errorMessage = ""  // Reset error message

        // Check if input values are valid
        if let A = Double(futureValue), let r = Double(interestRate), let n = Double(timePeriod), n > 0 {
            let presentValue = A / pow(1 + r / 100, n)
            initialInvestment = String(format: "%.2f", presentValue)
        } else {
            errorMessage = "Plz enter valid numbers."
        }
    }

    var body: some View {
        VStack {
            Text("Present Value Estimator")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)

            // Input fields for user data
            VStack(spacing: 15) {
                TextField("Enter future value", text: $futureValue)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)

                TextField("Enter interest rate", text: $interestRate)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)

                TextField("Enter time period", text: $timePeriod)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
            }
            .padding(.horizontal)

            // Calculate button
            Button(action: {
                calculatePresentValue()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)  // Dismiss keyboard
            }) {
                Text("Calculate Present Value")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.top)

            // Display result or error
            if !initialInvestment.isEmpty {
                Text("Initial Investment Needed: Rs. \(initialInvestment)")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding(.top)
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top)
            }

            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

struct PresentValueEstimator_Previews: PreviewProvider {
    static var previews: some View {
        PresentValueEstimator()
    }
}
