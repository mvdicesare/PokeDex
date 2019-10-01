//
//  PokemonController.swift
//  PokeDex
//
//  Created by Michael Di Cesare on 10/1/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit


class PokemonController {
    
   static func fetchPokemon(with searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        // do not place baseURL in this function on test in here???????
        // step 1
        guard let baseURL = URL(string: "https://pokeapi.co/api/v2") else {return}
        // add the first additional component
        let pokemonComponent = baseURL.appendingPathComponent("pokemon")
        // add the second additional compoent
        let finalURL = pokemonComponent.appendingPathComponent(searchTerm)
        print(finalURL)
        // Perform the dataTask
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // check for error
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            // check for data
            
            if let data = data {
                // if i can create a constannt from the value of the data retuned in the dataTask completion - then there is sata to work with
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(nil); return
                }
            }
        }.resume()
    }
    
    static func getImage(pokemon: Pokemon, completion: @escaping (UIImage?) -> Void) {
         let finalURL = pokemon.spritesDict.image
           
            let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            guard let data = data else {return}
                guard let image = UIImage(data: data) else {return}
                completion(image)
                
        }
        dataTask.resume()
    }
} // end of class
