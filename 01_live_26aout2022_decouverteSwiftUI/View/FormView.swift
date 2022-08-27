//
//  SousVue.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct FormView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var firstname2: String
    @Binding var name2: String
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(
                        header: Text("Nom")
                            .fontWeight(.heavy),
                        content: {
                            TextField("Entrer votre nom", text: $name2)
                        })
                    
                    Section(
                        header: Text("Prénom")
                            .fontWeight(.heavy),
                        content: {
                            TextField("Entrer votre prénom", text: $firstname2)
                        })
                }
                
                Button {
                    //
                    dismiss()
                } label: {
                    Text("Soumettre")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                .tint(.brown)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .shadow(radius: 5)
            }
            .navigationBarTitle("Présentez-vous 👋🏻")
            .background(Color.brown.opacity(0.5).ignoresSafeArea())
            .onAppear {
                UINavigationBar.appearance().largeTitleTextAttributes = [
                    .foregroundColor: UIColor.brown,
                    .font : UIFont(name:"Noteworthy", size: 40)!
                ]
                
                UITableView.appearance().backgroundColor = .clear
            }
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(firstname2: .constant(""), name2: .constant(""))
    }
}
