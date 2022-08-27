//
//  ContentView.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    // Initialise les objets UINavigationBar et UITableView avec des paramètres
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
    
    var titreFr: String = "Bonjour SwiftUI"
    var titreEng: String = "Hello SwiftUI"
    
    var sousTritreFr: String = "La nouvelle façon de développer des applications iOS"
    var sousTitreEng: String = "The new way to develop iOS apps"
    
    var body: some View {
        // Container vue permettant d'activer une navigation entre vues
        NavigationView {
            // Container vue permettant de scroller lorsque les éléments sortent de la safe area
            ScrollView(showsIndicators: false) {
                // Container vue verticale: les autres éléments seront en pile verticale
                VStack(alignment: .center, spacing: 35.0) {
                    // Container vue horizontal les autres éléments seront en pile horizontale
                    HStack(alignment: .center) {
                        
                        // Container vue Text: permet d'afficher des données de type string
                        Text(changementLangue ? sousTritreFr : sousTitreEng)
                            .font(.body)
                            .foregroundColor(Color("Color1"))
                            .multilineTextAlignment(.center)
                    }
                    
                    // Container affichant un séparateur
                    Divider()
                    
                    Text("Notion d'état avec @State")
                        .font(.title3)
                        .foregroundColor(Color.brown)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    // Bouton qui va changer la propriété de type booléenne déclarée plus haut
                    Button {
                        changementLangue.toggle()
                    } label: {
                        Text("Traduire")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .tint(Color("Color2"))
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .shadow(radius: 5)
                    
                    Divider()
                    
                    Text("Notion de binding avec @Binding")
                        .font(.title3)
                        .foregroundColor(Color.brown)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading) {
                        Text("Nom")
                            .fontWeight(.bold)
                            .foregroundColor(Color.brown)
                        
                        Text(name1)
                            .frame(width: 250, height: 15)
                            .padding(10.0)
                            .background(.ultraThickMaterial)
                            .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Prénom")
                            .fontWeight(.bold)
                            .foregroundColor(Color.brown)
                        
                        Text(firstname1)
                            .frame(width: 250, height: 15)
                            .padding(10.0)
                            .background(.ultraThickMaterial)
                            .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    Button {
                        modale.toggle()
                    } label: {
                        Text("Présentez-vous")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .tint(Color("Color1"))
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .shadow(radius: 5)
                    .sheet(isPresented: $modale) {
                        FormView(firstname2: $firstname1, name2: $name1)
                    }
                }
                .padding()
            }
            // Modifyer permettant d'afficher un titre dans la NavigationView
            .navigationBarTitle(
                // Condition ternaire qui selon si true/false affichera le titre en français ou en anglais
                Text(changementLangue ? titreFr : titreEng)
                    .font(.custom("Noteworthy", size: 35))
                    .foregroundColor(Color.brown)
            )
            // Modifyer toolbar ajoute des éléments (views) à la navigationBarTitle
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    // Container vue Image: permet d'afficher une image que l'on ajoute dans Assets
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
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
