//
//  ContentView.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font : UIFont(name:"Noteworthy", size: 40)!
        ]
        UITableView.appearance().backgroundColor = .clear
    }
    
    // Propriétés avec décorateur de vérification d'état @State
    @State var changementLangue: Bool = true
    
    @State var firstname1: String = ""
    @State var name1: String = ""
    @State private var modale: Bool = false;
    
    var titleFr: String = "Bonjour SwiftUI"
    var titleEng: String = "Hello SwiftUI"
    
    var body: some View {
        // Container vue de permettant d'activer une navigation entre vues
        NavigationView {
            // Container vue permettant de scroller lorsque les éléments sortent de la safe area
            ScrollView(showsIndicators: false) {
                // Container vue verticale: les autres éléments seront en pile verticale
                VStack(alignment: .center, spacing: 40.0) {
                    // Container vue horizontal les autres éléments seront en pile horizontale
                    HStack(alignment: .center) {
                        
                        // Container vue Text: permet d'afficher des données de type string
                        Text("la nouvelle façon de développer des applications iOS")
                            .font(.body)
                            .foregroundColor(Color("Color2"))
                            .multilineTextAlignment(.center)
                    }
                    
                    Divider()
                    
                    Text("Notions d'état avec @State")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
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
                    .shadow(radius: 5)
                    
                    Divider()
                        .padding()
                    
                    Text("Notions de Binding avec @Binding")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Text(name1)
                        .frame(width: 250, height: 15)
                        .padding(10.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    
                    Text(firstname1)
                        .frame(width: 250, height: 15)
                        .padding(10.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    
                    Button {
                        modale.toggle()
                    } label: {
                        Text("Afficher la modale")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                    }
                    .tint(.blue)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .shadow(radius: 5)
                    .sheet(isPresented: $modale) {
                        FormView(firstname2: $firstname1, name2: $name1)
                    }
                }
                .padding()
            }
            .navigationBarTitle(
                // Condition ternaire qui selon si true/false affichera le titre en français ou en anglais
                Text(changementLangue ? titleFr : titleEng)
                    .font(.custom("Noteworthy", size: 35))
                    .foregroundColor(Color.brown)
            )
            // Modifyer toolbar ajoute des éléments (views) à la navigationBarTitle
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    // Container vue Image: permet d'afficher image que l'on ajoute dans Assets
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
            .background(Color.brown.opacity(0.5).ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
