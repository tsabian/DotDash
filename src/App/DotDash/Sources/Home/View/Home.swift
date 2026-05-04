import Core
import SwiftUI

struct Home: View {
  @State private var plainText = "SOS"
  @State private var morseText = "... --- ..."
  @State private var currentWpm: Double = 20
  @State private var currentFrequency: Double = 600
  @State private var pressedAt: Date?

  private let morseEngine = MorseEngine()
  private let sidetone = SidetonePlayer()

  var keyerEngine: KeyerEngine {
    KeyerEngine(wpm: currentWpm)
  }

  var body: some View {
    TabView {
      NavigationView {
        ScrollView {
          VStack(spacing: 16) {
            Text("Etapas 1-3 (MVP): tradução + keyer + áudio TX")
              .font(.headline)
              .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 8) {
              Text("WPM: \(Int(currentWpm))")
              Slider(value: $currentWpm, in: 5 ... 40, step: 1)

              Text("Frequência: \(Int(currentFrequency)) Hz")
              Slider(value: $currentFrequency, in: 300 ... 1000, step: 10)
                .onChange(of: currentFrequency) { newValue in
                  sidetone.frequency = Float(newValue)
                }
            }

            Button {
              // tratado no gesto
            } label: {
              Circle()
                .fill(Color.gray)
                .frame(width: 120, height: 120)
                .overlay(Text("KEY").foregroundColor(.white).bold())
            }
            .simultaneousGesture(
              DragGesture(minimumDistance: 0)
                .onChanged { _ in
                  if pressedAt == nil {
                    pressedAt = Date()
                    sidetone.toneOn()
                  }
                }
                .onEnded { _ in
                  guard let start = pressedAt else { return }
                  let duration = Date().timeIntervalSince(start)
                  let symbol = keyerEngine.symbol(forPressDuration: duration)
                  morseText += String(symbol)
                  plainText = morseEngine.decode(morseText)
                  pressedAt = nil
                  sidetone.toneOff()
                }
            )

            HStack {
              Button("Espaço letra") {
                morseText += " "
                plainText = morseEngine.decode(morseText)
              }
              .buttonStyle(.bordered)

              Button("Espaço palavra") {
                morseText += " / "
                plainText = morseEngine.decode(morseText)
              }
              .buttonStyle(.bordered)

              Button("Limpar") {
                morseText = ""
                plainText = ""
              }
              .buttonStyle(.bordered)
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("Texto")
              TextField("Digite texto", text: $plainText)
                .textFieldStyle(.roundedBorder)
              Button("Converter para Morse") {
                morseText = morseEngine.encode(plainText)
              }
              .buttonStyle(.borderedProminent)
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("Morse")
              TextField("Digite código Morse", text: $morseText)
                .textFieldStyle(.roundedBorder)
              Button("Converter para Texto") {
                plainText = morseEngine.decode(morseText)
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
        Text("Etapa 4: áudio RX + lanterna + hápticos")
          .padding()
          .navigationTitle(Text("Praticar"))
      }
      .tabItem {
        Image(systemName: "checkmark.circle")
        Text("Praticar")
      }

      NavigationView {
        Text("Etapa 5: ajustes e persistência")
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
