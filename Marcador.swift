import SwiftUI

struct Marcador: View {
    let nombre: String
    @Binding var puntos: Int
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            Text(nombre)
                .font(.system(size: 12))
                .foregroundStyle(color)

            Text("\(puntos)")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(color)
                .contentTransition(.numericText())

            HStack(spacing: 12) {
                Button {
                    withAnimation {
                        puntos -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.bordered)
                .disabled(puntos == 0)

                Button {
                    withAnimation {
                        puntos += 1
                    }
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.borderedProminent)
            }
            .font(.headline)
        }
        .padding()
    }
}
