//
//  PokeShape.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 11/11/23.
//

import Foundation
class PokeShape : Codable{
    var id : String!
    var name : String!
    var imageName : String!
    var isFavorite: Bool = false
    
    public init(id:String, name: String, imageName: String){
        self.id = id
        self.imageName = imageName
        self.name = name 
    }
}
