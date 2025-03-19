//
//  HelpPage.swift
//  FinanceApp
//
//  Created by Nuwan Mataraarachchi on 2025-03-16.
//

import SwiftUI

struct HelpPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // Title
                Text("Help Guide")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Blue title
                    .padding(.top, 40)
                    .padding(.bottom, 30)
                    .frame(maxWidth: .infinity)
                    .border(Color.blue, width: 1) // Thin border around title
                
                // Function 1 - Calculating Required Interest Rate
                Group {
                    Text("1. Calculating Required Interest Rate")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("• This helps you find the rate of interest you need to grow your money to a target. For example, how much intrest rate you need to grow Rs. 100,000 to Rs. 150,000 in 5 years.")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("• You can use it to plan your future investments or just curious to know!")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    .border(Color.gray, width: 0.5) // Thin border
                    .padding(.vertical, 10)
                }
                
                // Function 2 - Calculating Investment Duration
                Group {
                    Text("2. Calculating Investment Duration")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("• This will tell you how long it takes to double or reach a target with your current investment and interest rate.")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("• Like, how long Rs. 100,000 will take to become Rs. 200,000 at 5% interest. It’s super helpful when planning.")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    .border(Color.gray, width: 0.5) // Thin border
                    .padding(.vertical, 10)
                }
                
                // Function 3 - Calculating Initial Investment (Present Value)
                Group {
                    Text("3. Calculating Initial Investment (Present Value)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("• Here, you can find out how much you need to invest today to reach a certain future value, given a specific interest rate and time.")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("• For example, how much to invest now to have Rs. 500,000 in 10 years at 6% interest. Simple right?")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    .border(Color.gray, width: 0.5) // Thin border
                    .padding(.vertical, 10)
                }
                
                // Function 4 - Calculating Investment with Monthly Contributions
                Group {
                    Text("4. Calculating Investment with Monthly Contributions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("• This helps you calculate how much you’ll have in the future when you make regular monthly contributions to your savings or investment account.")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("• For example, if you put Rs. 10,000 every month into your account at 4% interest, how much will you have after 5 years?")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    .border(Color.gray, width: 0.5) // Thin border
                    .padding(.vertical, 10)
                }
                
                // Function 5 - Loan Repayment Calculation
                Group {
                    Text("5. Loan Repayment Calculation")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("• This will help you calculate how long it’ll take to pay off a loan with a fixed monthly payment and interest rate.")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("• For example, if you borrow Rs. 300,000 and pay Rs. 35,000 each month with a 7% interest rate, how long will it take to pay it off?")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                    .border(Color.gray, width: 0.5) // Thin border
                    .padding(.vertical, 10)
                }
                
            }
            .padding(.horizontal)
        }
        .padding(.top, 40)
        .frame(maxHeight: .infinity)
    }
}

struct HelpPage_Previews: PreviewProvider {
    static var previews: some View {
        HelpPage()
    }
}
