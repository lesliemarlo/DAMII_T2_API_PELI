
//  APIResponse.swift
//  LeslieMarlo_PeliculasApp
//
//  Created by DAMII on 26/11/24.
//

import Foundation

struct APIResponse: Decodable {
    let peliculas: [Pelicula] //arreglo de pelis
    
    //como se mapean las claves del json
    enum CodingKeys: String, CodingKey {
        case peliculas = "results"
    }
}

//represenatcion de cada peli
struct Pelicula: Decodable, Identifiable {
    let id: Int
    let titulo: String
    let descripcion: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case titulo = "original_title"
        case descripcion = "overview"
        case image = "poster_path"
        
    }
    var imageURL: String {
            return "https://image.tmdb.org/t/p/w500\(image)"
        }
    
}
