//
//  TableViewDetail.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 11/11/23.
//

import Foundation
import UIKit

class TableViewDetail: UIViewController{
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nombreDetail: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var evolucion: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var informacion: UILabel!
    var selectedShapPoke : PokeShape!
    override func viewDidLoad() {
            super.viewDidLoad()
        // Configura el estado del botón de favoritos según el elemento
                if selectedShapPoke.isFavorite {
                    favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                } else {
                    favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }

                // Configura el manejador de eventos para el botón de favoritos
                favoriteButton.addTarget(self, action: #selector(toggleFavoriteButton), for: .touchUpInside)
            
        nombreDetail.text = selectedShapPoke.id + " - " + selectedShapPoke.name
        imageDetail.image = UIImage(named: selectedShapPoke.imageName)
        if(selectedShapPoke.id == "001"){
            evolucion.text = "Venasaur"
            tipo.text = "Planta/Veneno"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "004"){
            evolucion.text = "Charmander"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que parece una lagartija, su cola siempre esta ardiendo "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "007"){
            evolucion.text = "Squirtle"
            tipo.text = "Agua"
            informacion.text = "Un pokemon tipo agua que parece una tortuga, su cuerpo es una capa fuerte"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "152"){
            evolucion.text = "Squirtle"
            tipo.text = "Planta"
            informacion.text = "Un pokemon tipo agua que parece una hierba,es sensible a su entorno"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "155"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo fuego que parece un puercospín,su pelaje es muy suave"
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "158"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "252"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "255"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "258"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "494"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "497"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "500"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "387"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "390"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
        if(selectedShapPoke.id == "393"){
            evolucion.text = "Cyndaquil"
            tipo.text = "Fuego"
            informacion.text = "Un pokemon tipo planta que parece una rana, sus semillas brotan de su espalda "
            informacion.numberOfLines = 0  // Configura el número de líneas a 0 para permitir múltiples líneas
              informacion.lineBreakMode = .byWordWrapping
        }
    }
    @objc func toggleFavoriteButton() {
        // Cambia el estado de favorito
        selectedShapPoke.isFavorite.toggle()

        // Actualiza el estado del botón de favoritos
        let heartImage = selectedShapPoke.isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: heartImage), for: .normal)

        // Agrega o quita el elemento de la lista de favoritos en DataManager
        if selectedShapPoke.isFavorite {
            DataManager.shared.favoriteItems.append(selectedShapPoke)
        } else {
            DataManager.shared.favoriteItems.removeAll { $0.id == selectedShapPoke.id }
        }

        // Guarda la lista de favoritos en UserDefaults
        DataManager.shared.saveFavorites()

        // Puedes publicar una notificación para informar a otras partes de la aplicación que los favoritos han sido actualizados
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FavoritesUpdated"), object: nil)
    }
}
