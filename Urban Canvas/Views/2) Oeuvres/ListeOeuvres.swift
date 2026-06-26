//
//  ListeOeuvres.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//
import SwiftUI

struct ListeOeuvres: View {
    
    @Binding var selected: VueOeuvres
    
    @State private var showFilters = false
    @State private var selectedFilter = "Tous"
    
    let filters = ["Tous", "Invaders", "Mosaïque", "Mural", "Stencil", "Calligraphie"]
    
    var filteredOeuvres: [StreetArts] {
        if selectedFilter == "Tous" {
            return oeuvres
        } else {
            return oeuvres.filter { oeuvre in
                oeuvre.type.contains(selectedFilter)
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .topTrailing) {
                
                Color.backgroundGray
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        SegmentedPickerOeuvres(selected: $selected)
                        
                        Button {
                            withAnimation(.spring()) {
                                showFilters = true
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.title)
                                .foregroundStyle(.mainText)
                                .padding(12)
                                .background{
                                    Circle()
                                        .fill(Color.white.opacity(0.55))
                                        .background(.regularMaterial)
                                        .clipShape(Circle())
                                }
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    
                    Text("Liste des Street arts")
                        .font(.largeTitle)
                        .foregroundColor(.mainText)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView {
                        
                        LazyVStack (spacing:0) {
                            ForEach(filteredOeuvres) { oeuvre in
                            NavigationLink {
                                DetailOeuvre(oeuvre: oeuvre)
                            } label: {
                                OeuvreRow(oeuvre: oeuvre)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    
                            }.listRowBackground(Color.white)
                                Divider()
                            }.buttonStyle(.plain)
                            
                        }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 28))
                            .padding(.horizontal, 16)
                    }
                }
                
                if showFilters {
                    Color.black.opacity(0.18)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showFilters = false
                            }
                        }
                        .zIndex(1)
                }
                
                if showFilters {
                   PopupFilter(
                        selectedFilter: $selectedFilter,
                        showFilters: $showFilters,
                        filters: filters
                    )
                    .frame(width: 320)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 8)
                    .padding(.trailing,8)
                    .transition(
                        .scale(scale: 0.85, anchor: .topTrailing)
                        .combined(with: .opacity)
                    )
                    .zIndex(2)
                }
            }
        }
    }
}

#Preview {
    ListeOeuvres(selected: .constant(.liste))
}
