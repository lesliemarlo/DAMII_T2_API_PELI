import SwiftUI

struct PeliculaListView: View {
    
    @StateObject var viewModel: PeliculaListViewModel = PeliculaListViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Título
            Text("Películas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top)
            
            // Lista de pelis
            List {
                ForEach(viewModel.peliculas) { pelicula in
                    HStack(alignment: .center, spacing: 10) {
                        // Imagen
                        AsyncImage(url: URL(string: pelicula.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 110)
                                .cornerRadius(8)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            // Título
                            Text(pelicula.titulo)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text(pelicula.descripcion)
                        }
                    }
                    .frame(height: 120) // Altura para alinear
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.getPeliculas()
        }
    }
}

#Preview {
    PeliculaListView()
}
