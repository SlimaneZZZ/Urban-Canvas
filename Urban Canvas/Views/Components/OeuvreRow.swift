//
//  OeuvreRow.swift
//  Urban Canvas
//
//  Created by Petit dragon on 23/06/2026.
//

import SwiftUI

struct OeuvreRow: View {
    
    let oeuvre : StreetArts
    
    var body: some View {
        HStack (spacing : 16){
            
            Image(oeuvre.image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Capsule())
            
            VStack (alignment: .leading, spacing: 4
            ){
                Text(oeuvre.name)
                HStack{
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(Color(.secondText))
                    Text(oeuvre.city)
                        .foregroundStyle(Color(.secondText))
                    
                    Spacer()
                    
                }
                
                
            }
//            Image(systemName: "chevron.right")
//                    .foregroundStyle(.secondText)
//                    .font(.caption)
           
        } .padding(.horizontal, 8)
    }
       
}

#Preview {
    OeuvreRow(oeuvre : oeuvres[0])
}
