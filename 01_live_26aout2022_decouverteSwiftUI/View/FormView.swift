//
//  SousVue.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct FormView: View {
    
    @Binding var name: String
    
    var body: some View {
        TextField("Entrez votre nom", text: $name)
    }
    
}
/*
struct SousVue_Previews: PreviewProvider {
    static var previews: some View {
        SousVue()
    }
}*/
