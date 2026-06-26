//
//  CarteAuteur.swift
//  Urban Canvas
//
//  Created by Petit dragon on 25/06/2026.
//

import SwiftUI

struct CarteAuteur: View {
    
    let auteur: Auteur
    
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Group {
                if auteur.image.isEmpty {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                        
                        Image(systemName: "person.slash")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                } else {
                    Image(auteur.image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            Text(auteur.name)
                .font(.headline)
                .bold()
                .foregroundColor(.mainOrange)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("**Age :** \(auteur.age)")
                
                Text("**Origines :** \(auteur.origin)")
                
                Text("**Style :** \(auteur.style)")
            }
            .font(.caption)
            .foregroundColor(.black)
            
            Button {
                if let url = URL(string: auteur.website) {
                    openURL(url)
                }
            } label: {
                Text("Site web")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(Color.secondOrange)
                    .clipShape(Capsule())
            }
            .padding(.top, 8)
            .disabled(auteur.website.isEmpty)
            .opacity(auteur.website.isEmpty ? 0.4 : 1)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
    }
}

#Preview {
    CarteAuteur(auteur: auteurs[0])
}
