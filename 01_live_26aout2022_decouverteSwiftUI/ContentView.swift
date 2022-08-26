//
//  ContentView.swift
//  01_live_26aout2022_decouverteSwiftUI
//
//  Created by Lunack on 26/08/2022.
//

import SwiftUI




struct ContentView: View {
    
    var titleFr : String = "Bonjour, Bienvenue dans swiftUI"
    var titleEng : String = "Hello, welcome to swiftUI"
    @State var changement: Bool = true
    @State var name:String = "Pierric"
    @State private var formulaire:Bool = false;
    
    var body: some View {
        VStack{
            Text(changement ? titleFr : titleEng)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.blue)
                .font(.largeTitle)
            Text("la nouvelle façon de développer des application IOS")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .font(.custom("helveticaNeue", size: 20))
            Spacer()
            Image("swiftLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 5))
            Spacer()
            
            Text(name)
            Button {
                print("action boutton")
                changement.toggle()
            } label: {
                Text("Ceci est un bouton")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    
            }
            
            .tint(.green)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Button {
                print("action boutton")
                formulaire.toggle()
                
            } label: {
                Text("Bouton 2")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    
            }
            .sheet(isPresented: $formulaire) {
                SousVue(name: $name)
            }
            .tint(.blue)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)

        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
