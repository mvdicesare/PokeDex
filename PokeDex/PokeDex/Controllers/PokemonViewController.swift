//
//  PokemonViewController.swift
//  PokeDex
//
//  Created by Michael Di Cesare on 10/1/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLable: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func updateViews(pokemon: Pokemon, image: UIImage) {
        DispatchQueue.main.async {
            self.nameLable.text = pokemon.name
            self.idLabel.text = "\(pokemon.id)"
            self.abilitiesLable.text = pokemon.abilities[0].ability.name
            self.spriteImageView.image = image

        }
    }

} // end of class

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        PokemonController.fetchPokemon(with: searchText) { (pokemon) in
            guard let pokemon = pokemon else {return}
            PokemonController.getImage(pokemon: pokemon) { (image) in
                guard let image = image else {return}
                self.updateViews(pokemon: pokemon, image: image)
            }
        }
    }
}
