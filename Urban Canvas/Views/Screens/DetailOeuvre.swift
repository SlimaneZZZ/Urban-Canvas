//
//  DetailOeuvre.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//

import MapKit
import SwiftUI

struct DetailOeuvre: View {
    
    
    let oeuvre : StreetArts
    
    var position: MapCameraPosition {
            .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: oeuvre.latitude,
                        longitude: oeuvre.longitude
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.05,
                        longitudeDelta: 0.05
                    )
                )
            )
        }
    
    var body: some View {
        VStack (spacing : 16){
            Image(oeuvre.image)
                .resizable()
                .frame(height: 300)
            
            VStack (alignment: .leading, spacing : 16) {
                Text (oeuvre.name)
                    .font(.title2)
                    .foregroundStyle(Color(.mainOrange))
                    .bold()
                Text (oeuvre.description)
                    .font(.caption)
                VStack (alignment:.leading){
                    Text("**Type:** \(oeuvre.type.joined(separator: ", "))")
                    Text("**Condition:** \(oeuvre.condition)")
                    Text("**Date:** \(oeuvre.date)")
                    Text("**Auteur:** \(oeuvre.artist)")
                    Text("**Localisation:** \(oeuvre.localization) (Latitude : \(oeuvre.latitude, format : .number), Longitude : \(oeuvre.longitude, format : .number))")
                    
                }.font(.caption)
                
                Spacer()
                
                Map(initialPosition: position){
                    
                    Annotation(oeuvre.name, coordinate: CLLocationCoordinate2D(latitude: oeuvre.latitude, longitude: oeuvre.longitude))
                   {
                        
                        Image(oeuvre.image)
                           .resizable()
                           .scaledToFit()
                           .scaledToFill()
                           .frame(width: 40, height: 40)
                           .scaleEffect(5)
                           .offset(x: -10, y: 10)
                           .clipShape(Circle())
                           .overlay(Circle().stroke(.white, lineWidth: 2))
                    }
                } .mapStyle(.standard)
                    .environment(\.colorScheme, .dark)
                    .frame(height: 140)
                    .cornerRadius(20)
                
                Spacer()
                    
                    }.padding()
                    
                }.ignoresSafeArea()
              
                
             
            
            }
    
            
            
        }
        

#Preview {
    DetailOeuvre(oeuvre:oeuvres [1])
}
