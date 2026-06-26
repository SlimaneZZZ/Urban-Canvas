//
//  Missions.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//

import SwiftUI

struct Missions: View {
    
    @State private var selection: [StreetArts] = []
    @State private var decouvertes: Set<UUID> = []
    
    private var nombreDecouvertes: Int {
        decouvertes.count
    }
    
    private var total: Int {
        selection.count
    }
    
    private var missionTerminee: Bool {
        !selection.isEmpty && nombreDecouvertes == total
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.backgroundGray
                    .ignoresSafeArea()
                
                if selection.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image(systemName: "trophy.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.secondOrange)
                        
                        Text("Aucune mission en cours")
                            .font(.headline)
                            .foregroundColor(.mainText)
                        
                        boutonMission(titre: "Générer une mission")
                    }
                    .padding()
                    
                } else {
                    
                    ScrollView {
                        
                        LazyVStack(spacing: 16) {
                            
                            enteteProgression
                            
                            ForEach(Array(selection.enumerated()), id: \.element.id) { index, oeuvre in
                                
                                NavigationLink {
                                    DetailOeuvre(
                                        oeuvre: oeuvre,
                                        provientDeMission: true,
                                        dejaDecouverte: decouvertes.contains(oeuvre.id),
                                        onMarquerDecouverte: {
                                            decouvertes.insert(oeuvre.id)
                                        }
                                    )
                                } label: {
                                    CarteOeuvre(
                                        oeuvre: oeuvre,
                                        numero: index + 1,
                                        decouverte: decouvertes.contains(oeuvre.id)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                            
                            boutonMission(titre: "Nouvelle mission")
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                }
            }
            .navigationTitle("Mission")
        }
    }
    
    private var enteteProgression: some View {
        
        VStack(spacing: 8) {
            
            if missionTerminee {
                Text("Mission terminée ! Vous avez découvert \(total) œuvres urbaines.")
                    .font(.headline)
                    .foregroundColor(.mainOrange)
                    .multilineTextAlignment(.center)
            } else {
                Text("\(nombreDecouvertes) \(nombreDecouvertes <= 1 ? "œuvre découverte" : "œuvres découvertes") sur \(total)")
                    .font(.headline)
                    .foregroundColor(.mainText)
            }
            
            ProgressView(
                value: Double(nombreDecouvertes),
                total: Double(max(total, 1))
            )
            .tint(.mainOrange)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func boutonMission(titre: String) -> some View {
        
        Button {
            genererMission()
        } label: {
            Text(titre)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(Color.secondOrange)
                .clipShape(Capsule())
        }
    }
    
    private func genererMission() {
        
        let disponibles = oeuvres
        let maxCount = min(5, disponibles.count)
        
        guard maxCount >= 3 else {
            selection = []
            decouvertes = []
            return
        }
        
        var meilleure: [StreetArts] = []
        
        for _ in 0..<20 {
            
            let cible = Int.random(in: 3...maxCount)
            var resultat: [StreetArts] = []
            var auteursUtilises: Set<String> = []
            
            for oeuvre in disponibles.shuffled() {
                
                if resultat.count >= cible { break }
                if auteursUtilises.contains(oeuvre.artist) { continue }
                
                resultat.append(oeuvre)
                auteursUtilises.insert(oeuvre.artist)
            }
            
            meilleure = resultat
            
            let typesDistincts = Set(resultat.flatMap { $0.type })
            
            if resultat.count >= 3 && typesDistincts.count >= 2 {
                break
            }
        }
        
        selection = meilleure
        decouvertes = []
    }
}

#Preview {
    Missions()
}
