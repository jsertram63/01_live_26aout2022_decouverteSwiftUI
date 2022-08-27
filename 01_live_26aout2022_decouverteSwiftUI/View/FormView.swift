//
//  SousVue.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct FormView: View {
    
    @Binding var firstname: String
    @Binding var name: String
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.5).ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Prénom")
                    .font(.title3)
                    .fontWeight(.medium)
                
                TextField("Entrer votre prénom", text: $firstname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                
                Text("Nom")
                    .font(.title3)
                    .fontWeight(.medium)
                
                TextField("Entrer votre nom", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
            }
            .padding()
        }
    }
    
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(firstname: .constant(""), name: .constant(""))
    }
}
