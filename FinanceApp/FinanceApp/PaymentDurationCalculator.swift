//
//  PaymentDurationCalculator.swift
//  FinanceApp
//
//  Created by Nuwan Mataraarachchi on 2025-03-16.
//

import SwiftUI

struct PaymentDurationCalculator: View {
    @State private var loanAmount: String = ""
    @State private var monthlyPayment: String = ""
    @State private var interestRate: String = ""
    @State private var numberOfPayments: String = ""
    @State private var errorMessage: String = ""

    // calculate the number of payments needed to repy the loan
    func calculateNumberOfPayments() {
        errorMessage = "" // Clean previous error messages

        // Validate user inputs
        if let P = Double(loanAmount), let M = Double(monthlyPayment), let r = Double(interestRate), P > 0, M > 0, r > 0 {
            let monthlyRate = (r / 100) / 12  // Convert annual interest rate to monthly rate
            let n = log(M / (M - monthlyRate * P)) / log(1 + monthlyRate) // Monthly compounding formula

            numberOfPayments = String(format: "%.0f", n)
        } else {
            errorMessage = "Please enter valid numbers."
        }
    }

    var body: some View {
        VStack {
            Text("Loan Repayment Calculator")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .lineLimit(1)
                .padding(.top, 10)

            VStack(spacing: 25) {
                TextField("Loan Amount (P)", text: $loanAmount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 35)
                    .padding(.horizontal)

                TextField("Monthly Payment (M)", text: $monthlyPayment)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 35)
                    .padding(.horizontal)

                TextField("Annual Interest Rate (%)", text: $interestRate)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 35)
                    .padding(.horizontal)
            }

            Button(action: {
                calculateNumberOfPayments()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Calculate Duration")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.top, 40)

            if !numberOfPayments.isEmpty {
                Text("Number of Payments: \(numberOfPayments) months")
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

struct PaymentDurationCalculator_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDurationCalculator()
    }
}
