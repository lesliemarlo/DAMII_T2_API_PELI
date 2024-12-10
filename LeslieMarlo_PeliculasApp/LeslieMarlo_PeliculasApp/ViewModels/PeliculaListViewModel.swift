
//  PeliculaListViewModel.swift
//  LeslieMarlo_PeliculasApp
//
//  Created by DAMII on 26/11/24.
//

import Foundation

class PeliculaListViewModel: ObservableObject {
    @Published var peliculas: [Pelicula] = []
    
    
    func getPeliculas() {
            PeliculaService().getPeliculas { peliculas, message in
                
                DispatchQueue.main.async {
                    if let peliculas = peliculas {
                        self.peliculas = peliculas
                    }
                }
               
            }
        }
}
