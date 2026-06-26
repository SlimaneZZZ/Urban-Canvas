//
//  CarteOeuvre.swift
//  Urban Canvas
//
//  Created by Petit dragon on 25/06/2026.
//

import SwiftUI

struct CarteOeuvre: View {
    
    let oeuvre: StreetArts
    var numero: Int? = nil
    var decouverte: Bool = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Color.clear
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .overlay(
                    Image(oeuvre.image)
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            HStack(spacing: 6) {
                
                if let numero {
                    Text("\(numero)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.mainOrange)
                        .frame(width: 26, height: 26)
                        .overlay(
                            Circle().stroke(Color.mainOrange, lineWidth: 2)
                        )
                }
                
                Text("   \(oeuvre.name)")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.mainOrange)
                    .multilineTextAlignment(.center)
                
                if decouverte {
                    Text("✅")
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("**Type :** \(oeuvre.type.joined(separator: ", "))")
                
                Text("**Auteur :** \(oeuvre.artist)")
                
                Text("**Localisation :** \(oeuvre.localization)")
            }
            .font(.caption)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
    }
}

#Preview {
    CarteOeuvre(oeuvre: oeuvres[0], numero: 1, decouverte: true)
}
