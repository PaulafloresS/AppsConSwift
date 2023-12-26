//
//  InfoElemento.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 14/11/23.
//

import Foundation
import UIKit
class InfoElemento : UIViewController{
    
    @IBOutlet weak var mitaddanio: UILabel!
    @IBOutlet weak var Dobledanio: UILabel!
    @IBOutlet weak var NolehaceDanio: UILabel!
    @IBOutlet weak var danioLabel: UILabel!
    
    var ArrayElementos: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(ArrayElementos == "planta"){
            Dobledanio.text = "Agua,Tierra,Roca"
            NolehaceDanio.text = "Electrico, Roca "
            danioLabel.text = "Fuego, Volador, Hielo "
            mitaddanio.text = "Agua, Tierra, Roca "
        }
        else if(ArrayElementos == "agua"){
            Dobledanio.text = "Fuego, Tierra, Roca"
            NolehaceDanio.text = "Electrico, Planta"
            danioLabel.text = "Hielo, Agua, Roca "
            mitaddanio.text = "Fuego, Tierra, Roca "
        }else if (ArrayElementos == "Fuego"){
            Dobledanio.text = "Agua, Tierra, Roca"
            NolehaceDanio.text = "Hielo Agua Roca"
            danioLabel.text = "Agua, Tierra, Roca"
            mitaddanio.text = "Hielo, Agua, Roca "
        }else if(ArrayElementos == "rayo"){
            Dobledanio.text = "Agua, Tierra"
            NolehaceDanio.text = "Volador Tierra"
            danioLabel.text = "Agua, Tierra"
            danioLabel.text = "Agua, Tierra, Roca"
            mitaddanio.text = "Volador, Tierra"
        }
    }
}
