//
//  ContentView.swift
//  PodSample
//
//  Created by Ali Alhoshaiyan on 01/10/2021.
//

import SwiftUI
import Combine
import MoyasarSdk

let request = PaymentRequest(amount: 100, currency: "SAR", description: "Hello CocoaPods")

struct ContentView: View {
    func handlePaymentResult(result: PaymentResult) {
        switch (result) {
        case .completed(let payment):
            handleCompletedResult(payment)
            break
        case .failed(let error):
            handlePaymentError(error)
            break
        case .canceled:
            // Handle Cancel Result
            break
        @unknown default:
            fatalError()
        }
    }
    
    func handleCompletedResult(_ payment: ApiPayment) {
        switch payment.status {
        case "paid":
            print(payment.status)
            break
        default:
            print(payment.status)
        }
    }
    
    func handlePaymentError(_ error: Error) {
        // Handle all MoyasarError enum cases
    }
    
    var body: some View {
        CreditCardView(request: request, callback: handlePaymentResult)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
