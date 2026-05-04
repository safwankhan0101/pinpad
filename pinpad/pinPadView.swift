//
//  PinPadView.swift
//  PinButtons
//
//  Created by Iqbal Alhadad on 13/12/25.
//

import SwiftUI


struct PinPadView: View {
    @State private var enteredPin: String = ""
    @Binding var errorMessage: String?
    let pinLength = 4
    let gridItems = Array(repeating: GridItem(.fixed(100)), count: 3)
    var onPinEntered:(String) -> Void
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            VStack (spacing: 50) {
                
                Text("Enter PIN Code:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black)
                    .padding(.top,50)
                
                HStack {
                    ForEach(0..<pinLength, id: \.self){ index in
                        Circle()
                            .strokeBorder(lineWidth: 0)
                            .background(Circle().fill(.black).opacity(index < enteredPin.count ? 1:0.5))
                            .frame(width: index < enteredPin.count ? 15:12, height: index < enteredPin.count ? 15:12)
                    }
                }
                
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(1...9, id: \.self) { number in
                        PinPadButtons(number: "\(number)") {
                            handleInput(number: "\(number)")
                        }
                        
                    }
                    
                    Button(action: {
                        //face id
                    }) {
                        Image(systemName: "faceid")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                    }
                    .disabled(true)
                    .opacity(0.5)
                    
                    PinPadButtons(number: "0"){
                        handleInput(number: "0")
                    }
                    
                    Button(action: {
                        handleDelete()
                    }) {
                        Image(systemName: "delete.left")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                    }
                }
                if let message = errorMessage {
                    Text(message)
                        .padding(.horizontal)
                        .padding(.bottom,50)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .padding(.top,30)
                        .animation(.easeInOut, value: message)
                      //  .opacity(0.5)
                }
               
            }
        }
    }
    
    private func handleInput(number:String) {
        if enteredPin.count < pinLength {
            enteredPin.append(number)
            if enteredPin.count == pinLength {
                onPinEntered(enteredPin)
                enteredPin = ""
            }
        }
    }
    
    private func handleDelete() {
        if !enteredPin.isEmpty {
            enteredPin.removeLast()
        }
    }
}

#Preview {
    PinPadView(errorMessage: .constant("Incorrect PIN Entered"), onPinEntered: { pin in
        debugPrint("PIN Entered: \(pin)")
    })
}
