import SwiftUI

struct HomeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Financial Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    // Tile 1: InterestRateCalculator
                    NavigationLink(destination: InterestRateCalculator()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "arrow.down.circle.fill") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Interest Rate")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    
                    // Tile 2: FinalValueEstimator
                    NavigationLink(destination: FinalValueEstimator()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "chart.line.uptrend.xyaxis") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Final Value")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    
                    // Tile 3: PresentValueEstimator
                    NavigationLink(destination: PresentValueEstimator()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "dollarsign.circle.fill") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Present Value")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    
                    // Tile 4: PaymentEstimator
                    NavigationLink(destination: PaymentEstimator()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "creditcard.fill") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Payment")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    
                    // Tile 5: PaymentDurationCalculator
                    NavigationLink(destination: PaymentDurationCalculator()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "calendar.circle.fill") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Payment Duration")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    
                    // Tile 6: HelpPage
                    NavigationLink(destination: HelpPage()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 1) // Thin black border
                                .frame(height: 150)
                                .overlay(
                                    VStack {
                                        Image(systemName: "questionmark.circle.fill") // Relevant icon
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text("Help")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
