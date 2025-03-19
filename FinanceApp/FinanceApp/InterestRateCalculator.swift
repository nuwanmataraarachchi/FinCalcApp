import SwiftUI

struct InterestRateCalculator: View {
    @State private var initialInvestment: String = ""
    @State private var finalValue: String = ""
    @State private var timePeriod: String = ""
    @State private var interestRate: String = ""
    @State private var errorMessage: String = ""

    let CpY: Double = 12  // Compounding per year (Monthly)

   // calculae interest rate with monthly compounding
    func calculateInterestRate() {
        errorMessage = ""

        guard let P = Double(initialInvestment),
              let A = Double(finalValue),
              let nYears = Double(timePeriod), P > 0, A > 0, nYears > 0 else {
            errorMessage = "Please enter valid numbers."
            return
        }

        let N = nYears * CpY  // Convert years into months
        let rate = CpY * (pow(A / P, 1 / N) - 1) * 100  // Monthly compounding formula

        interestRate = String(format: "%.2f", rate)
    }

    var body: some View {
        VStack {
            Text("Interest Rate Calculator")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)

            VStack(spacing: 20) {
                TextField("Initial Investment (P)", text: $initialInvestment)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 45)
                    .padding(.horizontal)

                TextField("Final Value (A)", text: $finalValue)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 45)
                    .padding(.horizontal)

                TextField("Time Period (years)", text: $timePeriod)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 45)
                    .padding(.horizontal)
            }
            .frame(maxWidth: 350)

            Button(action: {
                calculateInterestRate()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Calculate Interest Rate")
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top)

            if !interestRate.isEmpty {
                Text("Required Interest Rate: \(interestRate)%")
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

struct InterestRateCalculator_Previews: PreviewProvider {
    static var previews: some View {
        InterestRateCalculator()
    }
}
