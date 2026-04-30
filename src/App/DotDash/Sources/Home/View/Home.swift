import Core
import SwiftUI

struct Home: View {
  @State private var plainText = "SOS"
  @State private var morseText = "... --- ..."

  private let engine = MorseEngine()

  var body: some View {
    TabView {
      NavigationView {
        ScrollView {
          VStack(spacing: 16) {
            Text("Etapa 1 (MVP): motor de tradução")
              .font(.headline)
              .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 8) {
              Text("Texto")
              TextField("Digite texto", text: $plainText)
                .textFieldStyle(.roundedBorder)
              Button("Converter para Morse") {
                morseText = engine.encode(plainText)
              }
              .buttonStyle(.borderedProminent)
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("Morse")
              TextField("Digite código Morse", text: $morseText)
                .textFieldStyle(.roundedBorder)
              Button("Converter para Texto") {
                plainText = engine.decode(morseText)
              }
              .buttonStyle(.bordered)
            }

            VStack {
              Text("Resultado")
                .frame(maxWidth: .infinity, alignment: .leading)
              Text(morseText)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
          }
          .padding(.horizontal, 20)
        }
        .navigationTitle("Código Morse")
      }
      .tabItem {
        Image(systemName: "book.closed.fill")
        Text("Aprender")
      }

      NavigationView {
        Text("Etapa 2: keyer + timing ITU")
          .padding()
          .navigationTitle(Text("Praticar"))
      }
      .tabItem {
        Image(systemName: "checkmark.circle")
        Text("Praticar")
      }

      NavigationView {
        Text("Etapa 3+: áudio, lanterna, hápticos e ajustes")
          .padding()
          .navigationTitle("Ajustes")
      }
      .tabItem {
        Image(systemName: "gearshape")
        Text("Ajustes")
      }
    }
    .padding(.horizontal, 16)
  }
}

#Preview {
  Home()
}
