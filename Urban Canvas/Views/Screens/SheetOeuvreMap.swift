//
//  SheetOeuvreMap.swift
//  Urban Canvas
//
//  Created by Petit dragon on 24/06/2026.
//

import SwiftUI

struct SheetOeuvreMap: View {

    let oeuvre: StreetArts
    let onClose: () -> Void
    let onOpenDetail: () -> Void

    var body: some View {

        VStack(spacing: 16) {

            Capsule()
                .fill(Color.secondary.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 8)

            HStack(spacing: 8) {

                Button {
                    onClose()
                } label: {
                    ZStack {
                        Circle()
                            .fill(.secondText.opacity(0.3))
                            .frame(width: 40, height: 40)

                        Image(systemName: "xmark")
                            .foregroundColor(.secondText)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    .frame(width: 44, height: 44)
                    .contentShape(Circle())
                }
                .buttonStyle(.plain)

                Spacer()

                Text(oeuvre.name)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)

                Spacer()

                Button {
                    onOpenDetail()
                } label: {
                    ZStack {
                        Circle()
                            .fill(.secondOrange)
                            .frame(width: 40, height: 40)

                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    .frame(width: 44, height: 44)
                    .contentShape(Circle())
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)

            Image(oeuvre.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .clipped()
                .contentShape(Rectangle())
                .allowsHitTesting(false)

            ScrollView {
                Text(oeuvre.description)
                    .font(.caption)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(20)
            }
        }
    }
}

#Preview {
    SheetOeuvreMap(
        oeuvre: oeuvres[0],
        onClose: {},
        onOpenDetail: {}
    )
}
