//
//  TableViewController_Type.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 13/11/23.
//

import Foundation
import UIKit
class TableViewController_Type : UIViewController, UITableViewDataSource, UITabBarDelegate{

    @IBOutlet weak var elementoTableView: UITableView!
    var elementoList = [PokeElemento]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
    }
    func initList(){
        let fuego = PokeElemento(nombreElemento: "Fuego", imageElemento: "p")
        elementoList.append(fuego)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellTypeID") as! TableViewCell_Type
        let thiselemento = elementoList[indexPath.row]
        tableViewCell.tipoelemento.text = thiselemento.nombreElemento
        tableViewCell.elementoimage.image = UIImage(named: thiselemento.nombreElemento)
        return tableViewCell
    }
}
