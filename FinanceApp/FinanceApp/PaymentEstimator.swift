import SwiftUI

struct PaymentEstimator: View {
    @State private var futureValue: String = ""
    @State private var interestRate: String = ""
    @State private var timePeriod: String = ""
    @State private var monthlyContribution: String = ""
    @State private var initialInvestment: String = ""
    @State private var errorMessage: String = ""
    
    func calculateInitialInvestment() {
        errorMessage = ""
        
        let CpY: Int = 12  // Compounds per year
        let PayPY: Int = 12 // Payments per year
        
        guard let fv = Double(futureValue), fv > 0 else {
            errorMessage = "Future Value must be greater than 0."
            initialInvestment = ""
            return
        }
        
        guard let dv = Int(timePeriod), dv > 0 else {
            errorMessage = "Duration must be greater than 0."
            initialInvestment = ""
            return
        }
        
        guard let r = Double(interestRate), r > 0 else {
            errorMessage = "Interest rate must be greater than 0."
            initialInvestment = ""
            return
        }
        
        guard let pmt = Double(monthlyContribution), pmt >= 0 else {
            errorMessage = "Monthly contribution must be 0 or greater."
            initialInvestment = ""
            return
        }
        
        let i = r / Double(CpY * 100)
        let durationInYears = dv // Assuming duration is given in years
        let N = Double(durationInYears * PayPY)
        let j = pow(1 + i, N)
        let monthlyContributionEffect = pmt > 0 ? (pmt * ((j - 1) / i)) : 0
        let pv = (fv - monthlyContributionEffect) / j
        
        initialInvestment = pv >= 0 ? String(format: "%.2f", pv) : "0"
    }
    
    var body: some View {
        VStack {
            Text("Payment Estimator")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)
            
            VStack(spacing: 20) {
                TextField("Future Value (FV)", text: $futureValue)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .padding(.horizontal)
                
                TextField("Interest Rate (Annual %)", text: $interestRate)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .padding(.horizontal)
                
                TextField("Time Period (in years)", text: $timePeriod)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .padding(.horizontal)
                
                TextField("Monthly Contribution", text: $monthlyContribution)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .padding(.horizontal)
            }
            
            Button(action: {
                calculateInitialInvestment()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Calculate Initial Investment")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.top)
            
            if !initialInvestment.isEmpty {
                Text("Required Initial Investment: \(initialInvestment)")
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

struct PaymentEstimator_Previews: PreviewProvider {
    static var previews: some View {
        PaymentEstimator()
    }
}
