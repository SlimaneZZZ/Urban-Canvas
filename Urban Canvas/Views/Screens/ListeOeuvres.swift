//
//  ListeOeuvres.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//


import SwiftUI

struct ListeOeuvres: View {
    var body: some View {
       
        NavigationStack{
            
            List (oeuvres){ oeuvre in
                NavigationLink{
                    DetailOeuvre(oeuvre: oeuvre)
                }label:{
                    
                    OeuvreRow(oeuvre: oeuvre)
                }
            }.navigationTitle("Liste des Street arts")
            
        }
        
        
        
    }
}

#Preview {
    ListeOeuvres()
}
