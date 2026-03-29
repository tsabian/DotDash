//
//  Home.swift
//  DotDash
//
//  Created by Tiago de Oliveira on 13/10/25.
//

import SwiftUI

struct Home: View {
  var body: some View {
    TabView {
      NavigationView {
        ScrollView {
          VStack(spacing: 16) {
            ZStack {
              Circle()
                .fill(Color.gray)
                .opacity(0.3)
                .frame(width: 230, height: 230)
              Circle()
                .fill(Color.gray)
                .frame(width: 210, height: 210)
            }
          }
          .padding(.horizontal, 20)
          HStack {
            Text("Frequência")
            Spacer()
          }
          Slider(value: .constant(50), in: 0 ... 100) {
            Text("50")
          }
          .tint(Color.gray)
          HStack {
            Text("PAM")
            Spacer()
          }
          Slider(value: .constant(20), in: 0 ... 100) {
            Text("PAM")
          }
          .tint(Color.gray)
          VStack {
            Text("Tradução de texto")
              .frame(maxWidth: .infinity,
                     maxHeight: 40,
                     alignment: .init(horizontal: .leading, vertical: .center))
            Text("-/.-..-..-.--.")
              .frame(maxWidth: .infinity,
                     maxHeight: 40,
                     alignment: .init(horizontal: .leading, vertical: .center))
          }
          .padding(8)
          .background(Color(.systemGray6))
          .cornerRadius(8)
        }
        .navigationTitle("Código Morse")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 1) {
              Button {
                // ação 1: microfone
              } label: {
                Image(systemName: "mic.fill")
              }
              .tint(Color.gray)
              .frame(width: 42, height: 32)
              .cornerRadius(8)
              Button {
                // ação 2: configurações
              } label: {
                Image(systemName: "gearshape")
              }
              .tint(Color.gray)
              .frame(width: 42, height: 32)
              .cornerRadius(8)
            }
          }
        }
      }
      .tabItem {
        Image(systemName: "book.closed.fill")
        Text("Aprender")
      }
      NavigationView {
        VStack {
          Text("Área de prática")
        }
        .padding()
        .navigationTitle(Text("Praticar"))
        .toolbar {
          Button {
            // action
          } label: {
            Image(systemName: "plus")
          }
          .accessibilityLabel("Adicionar prática")
          .accessibilityHint("Cria uma nova sessão de prática")
        }
      }
      .tabItem {
        Image(systemName: "checkmark.circle")
        Text("Praticar")
      }
      NavigationView {
        VStack(spacing: 16) {
          Text("Configurações")
            .font(.title2)
          Text("Conteúdo de exemplo")
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Configurações")
      }
      .tabItem {
        Image(systemName: "gearshape")
        Text("Ajustes")
      }
    }
    .padding(EdgeInsets(top: .zero,
                        leading: 16,
                        bottom: .zero,
                        trailing: 16))
  }
}

#Preview {
  Home()
}
