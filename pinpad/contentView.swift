

//
//  ContentView.swift
//  PinButtons
//
//  Created by Iqbal Alhadad on 13/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var errorMessage: String?
    let desiredPin:String = "1234"
    var body: some View {
        PinPadView(errorMessage: $errorMessage) {
            pin in
            handleSubmittedPin(pin)
            debugPrint("Entered PIN: \(pin)")
        }
    }
    
    private func handleSubmittedPin(_ pin:String){
        if pin == desiredPin {
            debugPrint("Yeah!..")
        } else {
            errorMessage = "Incorrect PIN"
        }
    }
}

#Preview {
    ContentView()
}
