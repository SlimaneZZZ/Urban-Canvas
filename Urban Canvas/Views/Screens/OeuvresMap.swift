//
//  OeuvresMap.swift
//  Urban Canvas
//
//  Created by Petit dragon on 24/06/2026.
//
import MapKit
import SwiftUI

struct OeuvresMap: View {
    
    @Binding var selected: VueOeuvres
    
    @State private var oeuvreSelectionne: StreetArts? = nil
    @State private var oeuvreDetail: StreetArts? = nil
    @State private var oeuvreDetailEnAttente: StreetArts? = nil
    
    @State private var showFilters = false
    @State private var selectedFilter = "Tous"
    
    let filters = ["Tous", "Invaders", "Mosaïque", "Mural", "Stencil", "Calligraphie"]

    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.866669, longitude: 2.43333),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var oeuvresMap: [StreetArts] = oeuvres
    
    var filteredOeuvres: [StreetArts] {
        if selectedFilter == "Tous" {
            return oeuvresMap
        } else {
            return oeuvresMap.filter { oeuvre in
                oeuvre.type.contains(selectedFilter)
            }
        }
    }

    var body: some View {

        NavigationStack {

            ZStack(alignment: .top) {
                
                Map(position: $position, interactionModes: [.pan, .rotate, .zoom]) {

                    ForEach(filteredOeuvres) { oeuvre in

                        Annotation(
                            oeuvre.name,
                            coordinate: CLLocationCoordinate2D(
                                latitude: oeuvre.latitude,
                                longitude: oeuvre.longitude
                            )
                        ) {
                            Button {
                                oeuvreSelectionne = oeuvre
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.orange)
                                        .frame(width: 44, height: 44)

                                    Image(systemName: "mappin")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                
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
                            .background {
                                Circle()
                                    .fill(Color.white.opacity(0.55))
                                    .background(.regularMaterial)
                                    .clipShape(Circle())
                            }
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .padding(.top, 64)
                .ignoresSafeArea(edges: .top)
            }
            .overlay {
                if showFilters {
                    ZStack(alignment: .topTrailing) {
                        Color.black.opacity(0.18)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showFilters = false
                                }
                            }
                        
                        PopupFilter(
                            selectedFilter: $selectedFilter,
                            showFilters: $showFilters,
                            filters: filters
                        )
                        .frame(width: 320)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 70)
                        .padding(.trailing, 8)
                        .transition(
                            .scale(scale: 0.85, anchor: .topTrailing)
                            .combined(with: .opacity)
                        )
                    }
                }
            }
            .navigationDestination(item: $oeuvreDetail) { oeuvre in
                DetailOeuvre(oeuvre: oeuvre)
            }
        }
        .sheet(item: $oeuvreSelectionne, onDismiss: ouvrirDetailEnAttente) { oeuvre in
            SheetOeuvreMap(
                oeuvre: oeuvre,
                onClose: {
                    oeuvreSelectionne = nil
                },
                onOpenDetail: {
                    oeuvreDetailEnAttente = oeuvre
                    oeuvreSelectionne = nil
                }
            )
            .presentationDetents([.height(360)])
            .presentationDragIndicator(.hidden)
        }
    }

    private func ouvrirDetailEnAttente() {
        guard let oeuvre = oeuvreDetailEnAttente else {
            return
        }

        oeuvreDetailEnAttente = nil
        oeuvreDetail = oeuvre
    }
}


#Preview {
    OeuvresMap(selected: .constant(.carte))
}
