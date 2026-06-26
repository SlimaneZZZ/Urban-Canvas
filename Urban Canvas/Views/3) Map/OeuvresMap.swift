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
                                    
                                    Triangle()
                                        .fill(.white)
                                        .frame(width: 20, height: 16)
                                        .offset(y: 23)
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 50, height: 50)
                                    
                                    Triangle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.secondOrange, .mainOrange],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 14, height: 11)
                                        .offset(y: 23)
                                    
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.secondOrange, .mainOrange],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(width: 44, height: 44)

                                    Image(systemName: "mappin")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .black))
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


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


#Preview {
    OeuvresMap(selected: .constant(.carte))
}
