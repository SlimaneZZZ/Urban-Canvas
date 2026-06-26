//
//  PopupFilter.swift
//  Urban Canvas
//
//  Created by Petit dragon on 24/06/2026.
//

import SwiftUI

struct PopupFilter: View {
        @Binding var selectedFilter: String
        @Binding var showFilters: Bool
        let filters: [String]
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                       
                       Text("Liste des filtres")
                           .font(.title2)
                           .fontWeight(.bold)
                       
                       Text("Choisissez un type d’art")
                           .font(.title3)
                       
                       VStack(spacing: 8) {
                           ForEach(filters, id: \.self) { filter in
                               
                               Button {
                                   selectedFilter = filter
                                   showFilters = false
                               } label: {
                                   Text(filter)
                                       .font(.title3)
                                       .fontWeight(.medium)
                                       .foregroundStyle(selectedFilter == filter ? .orange : .black)
                                       .frame(maxWidth: .infinity)
                                       .padding(.vertical, 12)
                                       .background(Color.gray.opacity(0.18))
                                       .clipShape(Capsule())
                               }
                           }
                       }
                       
                       Spacer()
                   }
                    .padding(20)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .shadow(radius: 20)
               }
        }


    #Preview {
        PopupFilter(selectedFilter: .constant("Tous"), showFilters: .constant(true), filters: ["Tous", "Invaders", "Mosaïques", "Mural", "Stencil", "Calligraphie"])
    }

