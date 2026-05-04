//
//  PinPadButtons.swift
//  PinButtons
//
//  Created by Iqbal Alhadad on 13/12/25.
//

import SwiftUI

struct PinPadButtons: View {
    var number: String? = nil
    var icon:String? = nil
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            if let number = number {
                Text(number)
                    .font(.title)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.black)
                    .background(Circle().fill(Color.black.opacity(0.15)))
            }
            else if let icon = icon {
                Image(systemName: icon)
                    .font(.title)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.black)
                    .background(Circle().fill(Color.black.opacity(0.15)))
            }
        }
    }
}

#Preview {
    PinPadButtons(number: nil, icon: "person") {
        debugPrint("Pressed")
    }
}
