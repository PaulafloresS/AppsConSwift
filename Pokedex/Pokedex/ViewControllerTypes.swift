//
//  ViewControllerTypes.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 14/11/23.
//

import UIKit
var ArrayElementos = ["planta","agua","Fuego","rayo"]

class ViewControllerTypes: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellcollecttionViewType
        let list = ArrayElementos[indexPath.row]
        cell?.imagenelemento.image = UIImage(named: list)
        
        return cell!
        
    }
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    var selectedCell: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayElementos.count
        
    }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            selectedCell = indexPath
            
            self.performSegue(withIdentifier: "detailElement", sender: self)
            
            //        selectedCell = indexPath
            //        print("Posicion celda: \(ArrayElementos[selectedCell!.row])")
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailElement" {
            
            let tableViewDetail = segue.destination as? InfoElemento
            
            tableViewDetail?.ArrayElementos = ArrayElementos[selectedCell!.row]
        }
    }
        
    }

