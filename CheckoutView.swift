//
//  CheckoutView.swift
//  DonutShop
//
//  Created by Allan Auezkhan on 17.05.2026.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://t3.ftcdn.net/jpg/04/51/00/44/360_F_451004451_o5HogNoJ6SjzOOHFncJRXFrwJDhu7DBd.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Oops!", isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }

    func placeOrder() async {
        // Create a clean network-ready copy of your order data
        let networkOrder = OrderData(
            type: order.type,
            quantity: order.quantity,
            specialRequestEnabled: order.specialRequestEnabled,
            extraFrosting: order.extraFrosting,
            addSprinkles: order.addSprinkles,
            name: order.name,
            streetAddress: order.streetAddress,
            city: order.city,
            zip: order.zip
        )

        // Encode the clean struct instead of the observable class
        guard let encoded = try? JSONEncoder().encode(networkOrder) else {
            errorMessage = "Failed to encode order"
            showingError = true
            return
        }

        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            // Decode back into the clean struct
            let decodedOrder = try JSONDecoder().decode(OrderData.self, from: data)
            
            // Display the success message using the decoded data!
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) donuts is on the way!"
            showingConfirmation = true
        } catch {
            errorMessage = "Check out failed: \(error.localizedDescription)"
            showingError = true
        }
    }
}
