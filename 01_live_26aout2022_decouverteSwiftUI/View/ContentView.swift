//
//  ContentView.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    // Propriétés avec décorateur de vérification d'état @State
    @State var changementLangue: Bool = true
    @State var name: String = "Votre nom appaîtra ici"
    @State private var formulaire: Bool = false;
    
    var titleFr: String = "Bonjour, bienvenue dans SwiftUI"
    var titleEng: String = "Hello, welcome to SwiftUI"
    
    var body: some View {
        VStack{
            // Container vue Text: permet d'afficher des données de type string
            Text(changementLangue ? titleFr : titleEng)
                .font(.custom("Noteworthy", size: 25))
                .foregroundColor(Color("Color1"))
                .padding()
                .multilineTextAlignment(.center)
            
            // Container vue Image: permet d'afficher image que l'on ajoute dans Assets
            Image("swift")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(
                            Color("Color1"),
                            lineWidth: 8
                        )
                )
                .shadow(radius: 5)
                .padding()
            
            Text("la nouvelle façon de développer des application IOS")
                .foregroundColor(Color("Color1"))
                .padding()
                .multilineTextAlignment(.center)
            
            Divider()
                .padding()
            
            Text(name)
                .padding()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
            Button {
                formulaire.toggle()
            } label: {
                Text("Inscrire son nom")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
            }
            .tint(.blue)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .shadow(radius: 5)
            .sheet(isPresented: $formulaire) {
                SousVue(name: $name)
            }
            
            Spacer()
            
            // Bouton qui va changer la propriété de type booléenne déclarée plus haut
            Button {
                changementLangue.toggle()
            } label: {
                Text("Changer la langue du titre")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .tint(.green)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
