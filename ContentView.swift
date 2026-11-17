import SwiftUI

struct ContentView: View {
    @State private var puntosEquipo1 = 0
    @State private var puntosEquipo2 = 0

    var body: some View {
        VStack(spacing: 32) {
            Text("Marcador")
                .font(.largeTitle)
                .bold()

            HStack(spacing: 12) {
                Marcador(nombre: "Equipo 1", puntos: $puntosEquipo1, color: .blue)
                
                Text("vs")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.secondary)
                
                Marcador(nombre: "Equipo 2", puntos: $puntosEquipo2, color: .orange)
            }

            textoEstadoJuego()
                .font(.headline)
                .transition(.scale.combined(with: .opacity))

            Button("Reiniciar", role: .destructive) {
                withAnimation {
                    puntosEquipo1 = 0
                    puntosEquipo2 = 0
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    @ViewBuilder
    private func textoEstadoJuego() -> some View {
        if puntosEquipo1 > puntosEquipo2 {
            Text("Va ganando: Equipo 1")
                .foregroundStyle(.blue)
        } else if puntosEquipo2 > puntosEquipo1 {
            Text("Va ganando: Equipo 2")
                .foregroundStyle(.orange)
        } else {
            Text("Empate")
                .foregroundStyle(.secondary)
        }
    }
}
