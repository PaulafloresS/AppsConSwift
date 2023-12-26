//
//  PokeElemento.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 13/11/23.
//

import Foundation
import UIKit

class PokeElemento{
    var nombreElemento : String!
    var imageElemento : String!
    
    public init(nombreElemento: String, imageElemento: String){
        self.imageElemento = imageElemento
        self.nombreElemento = nombreElemento
    }
}
