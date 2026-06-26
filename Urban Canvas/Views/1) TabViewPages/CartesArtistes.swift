//
//  CartesArtistes.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//

import SwiftUI

struct CartesArtistes: View {
    
    let colonnes = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        
        ZStack {
            
            Color.backgroundGray
                .ignoresSafeArea()
            
            ScrollView {
                
                LazyVGrid(columns: colonnes, spacing: 16) {
                    
                    ForEach(auteurs) { auteur in
                        CarteAuteur(auteur: auteur)
                    }
                }
                .padding(16)
            }
        }
    }
}



#Preview {
    CartesArtistes()
}
