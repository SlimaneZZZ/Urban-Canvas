//
//  PickerView.swift
//  Urban Canvas
//
//  Created by Petit dragon on 24/06/2026.
//

import SwiftUI

enum VueOeuvres: String, CaseIterable, Identifiable {
    case liste = "Liste"
    case carte = "Carte"
    
    var id: String { rawValue }
}

struct PickerView: View {
    
    @State private var selected: VueOeuvres = .liste
    
    var body: some View {
        
        ZStack {
            
            if selected == .liste {
                ListeOeuvres(selected: $selected)
            }
            
            if selected == .carte {
                OeuvresMap(selected: $selected)
            }
        }
    }
}

struct SegmentedPickerOeuvres: View {
    
    @Binding var selected: VueOeuvres
    
    var body: some View {
        
        HStack(spacing: 4) {
            
            ForEach(VueOeuvres.allCases) { vue in
                
                Button {
                    withAnimation {
                        selected = vue
                    }
                } label: {
                    Text(vue.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(selected == vue ? Color.secondOrange : Color.clear)
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(
            Capsule()
                .fill(Color.white.opacity(0.85))
        )
    }
}

#Preview {
    PickerView()
}
