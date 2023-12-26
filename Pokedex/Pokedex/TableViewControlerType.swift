//
//  TableViewControlerType.swift
//  Pokedex
//
//  Created by Ana Paula Flores on 13/11/23.
//

import UIKit

class TableViewControlerType: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tablePokeElemento: UITableView!

    var pokeElementList = [PokeType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false

        initList()
        initSearchController()
    }
    func initSearchController(){
    }
    func initList() {
        let Tierra = PokeType(elemento:"Tierra", imageElemento: "Bulbasaur")
        pokeElementList.append(Tierra)
        let Fuego = PokeType(elemento:"Fuego", imageElemento: "Bulbasaur")
        pokeElementList.append(Fuego)
        let Agua = PokeType(elemento:"Fuego", imageElemento: "Bulbasaur")
        pokeElementList.append(Agua)
              
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return pokeElementList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCelllIDelemento") as! TableViewCellType
        let thisPoketype = pokeElementList[indexPath.row]
        
        tableViewCell.elemento.text = thisPoketype.elemento
        tableViewCell.imageElemento.image = UIImage(named: thisPoketype.imageElemento)
        return tableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        let searchText = searchBar.text!
//
//        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
//    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Todo") {
//        print("Search Text: \(searchText), Scope Button: \(scopeButton)")
//
//        filteredShapesPoke = pokeShapeList.filter { shape in
//            let scopeMatch = (scopeButton == "Todo" || shape.name.lowercased().contains(scopeButton.lowercased()))
//
//            if !searchText.isEmpty {
//                let searchTextMatch: Bool
//                if scopeButton == "Número" {
//                    // Filtrar por número
//                    searchTextMatch = shape.id.lowercased().contains(searchText.lowercased())
//                } else {
//                    // Filtrar por nombre
//                    searchTextMatch = shape.name.lowercased().contains(searchText.lowercased())
//                }
//
//                return scopeMatch && searchTextMatch
//            } else {
//                return scopeMatch
//            }
//        }
//
//        tablePokeElemento.reloadData()
//    }

     


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
//            if let indexPath = self.tablePokeElemento.indexPathForSelectedRow {
//                let tableViewDetail = segue.destination as? TableViewType
//                let selectedShape : PokeType!
//                if(searchController.isActive){
//                    selectedShape = filteredShapesPoke[indexPath.row]
//                }else{
//                    selectedShape = pokeShapeList[indexPath.row]
//                }
                
//
//                tableViewDetail!.selectedShapPoke = selectedShape
//                self.tablePokeElemento.deselectRow(at: indexPath, animated: true)
            }
        }
    
}

