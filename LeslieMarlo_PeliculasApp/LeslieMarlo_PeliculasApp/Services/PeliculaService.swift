
//  PeliculaService.swift
//  LeslieMarlo_PeliculasApp
//
//  Created by DAMII on 26/11/24.
//

import Foundation

class PeliculaService {
    
    func getPeliculas(completion: @escaping ([Pelicula]?, String?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=3cae426b920b29ed2fb1c0749f258325"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
                   
                   if (success) {
                       guard let data = data else {
                           completion(nil, message ?? "Error: no data")
                           return
                       }
                       
                       do {
                           let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                           completion(apiResponse.peliculas, nil)
                       } catch let error {
                           completion(nil, "Error: \(error.localizedDescription) ")
                       }
                   } else {
                       completion(nil, message ?? "Error: no response")
                   }
               }
    }
}
