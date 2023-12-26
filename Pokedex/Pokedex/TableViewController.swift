import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet weak var tablePokelist: UITableView!
    
    var pokeShapeList = [PokeShape]()
    var filteredShapesPoke = [PokeShape]()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        initList()
        initSearchController()
        NotificationCenter.default.addObserver(self, selector: #selector(favoritesUpdated), name: NSNotification.Name(rawValue: "FavoritesUpdated"), object: nil)
        
    }
    deinit {
         // Remover el observador al salir de la vista para evitar fugas de memoria
         NotificationCenter.default.removeObserver(self)
     }
    @objc func favoritesUpdated() {
         // Actualizar la tabla cuando se recibe la notificación de actualización de favoritos
         tablePokelist.reloadData()
     }
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        definesPresentationContext = true
        tablePokelist.tableHeaderView = searchController.searchBar

        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Numero","Nombre"]
        searchController.searchBar.delegate = self
        
    }
    func initList() {
        let Balbassaur = PokeShape(id:"001", name: "Balbassaur", imageName: "Bulbasaur")
                pokeShapeList.append(Balbassaur)
                let Charmander = PokeShape(id:"004", name: "Charmander", imageName: "Charmander")
                pokeShapeList.append(Charmander)
                let Squirtle = PokeShape(id:"007", name: "Squirtle", imageName: "squirtle")
                pokeShapeList.append(Squirtle)
                let Chikorita = PokeShape(id:"152", name: "Chikorita", imageName: "Chikorita")
                pokeShapeList.append(Chikorita)
                let Cyndaquil = PokeShape(id:"155", name: "Cyndaquil", imageName: "Cyndaquil")
                pokeShapeList.append(Cyndaquil)
                let Totodile = PokeShape(id:"158", name: "Totodile", imageName: "p")
                pokeShapeList.append(Totodile)
                let Treecko = PokeShape(id:"252", name: "Treecko", imageName: "p")
                pokeShapeList.append(Treecko)
                let Torchic = PokeShape(id:"255", name: "Torchic", imageName: "p")
                pokeShapeList.append(Torchic)
                let Midkip = PokeShape(id:"258", name: "Midkip", imageName: "p")
                pokeShapeList.append(Midkip)
                let Snivy = PokeShape(id:"494", name: "Snivy", imageName: "p")
                pokeShapeList.append(Snivy)
                let Tepig = PokeShape(id:"497", name: "Tepig", imageName: "p")
                pokeShapeList.append(Tepig)
                let Oshawott = PokeShape(id:"500", name: "Oshawott", imageName: "p")
                pokeShapeList.append(Oshawott)
                let Turtwig = PokeShape(id:"387", name: "Turtwing", imageName: "p")
                pokeShapeList.append(Turtwig)
                
                let Chimchar = PokeShape(id:"390", name: "Chimchar", imageName: "p")
                pokeShapeList.append(Chimchar)
                
                let Piplup = PokeShape(id:"390", name: "Piplup", imageName: "p")
                pokeShapeList.append(Piplup)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive){
            return filteredShapesPoke.count
        }
        return pokeShapeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCelllID") as! TableViewCell
                let thisShape: PokeShape!

                if searchController.isActive {
                    thisShape = filteredShapesPoke[indexPath.row]
                } else {
                    thisShape = pokeShapeList[indexPath.row]
                }

                tableViewCell.nombrepoke.text = thisShape.id + " " + thisShape.name
                tableViewCell.imagepoke.image = UIImage(named: thisShape.imageName)

                // Configura el botón de favoritos según el estado del elemento
              

                         // Configura el manejador de eventos para el  .touchUpInside)

                         return tableViewCell
    }
    @objc func favoriteButtonTapped(_ sender: UIButton) {
         let selectedIndex = sender.tag

         // Obtiene el elemento seleccionado
         var selectedShape: PokeShape

         if searchController.isActive {
             selectedShape = filteredShapesPoke[selectedIndex]
         } else {
             selectedShape = pokeShapeList[selectedIndex]
         }

         // Cambia el estado de favorito
         selectedShape.isFavorite.toggle()

         // Actualiza la tabla
         tablePokelist.reloadData()

         // Agrega o quita el elemento de la lista de favoritos en DataManager
         if selectedShape.isFavorite {
             DataManager.shared.favoriteItems.append(selectedShape)
         } else {
             DataManager.shared.favoriteItems.removeAll { $0.id == selectedShape.id }
         }

         // Guarda la lista de favoritos en UserDefaults
         DataManager.shared.saveFavorites()
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Todo") {
        print("Search Text: \(searchText), Scope Button: \(scopeButton)")

        // Utiliza pokeShapeList en lugar de DataManager.shared.favoriteItems
        filteredShapesPoke = pokeShapeList.filter { shape in
            let searchTextMatch: Bool
            if scopeButton == "Numero" {
                // Filtrar por número
                searchTextMatch = shape.id.lowercased().starts(with: searchText.lowercased())
            } else {
                // Filtrar por nombre
                searchTextMatch = shape.name.lowercased().starts(with: searchText.lowercased())
                print(searchTextMatch)
            }

            return searchTextMatch
        }

        tablePokelist.reloadData()
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tablePokelist.indexPathForSelectedRow {
                let tableViewDetail = segue.destination as? TableViewDetail
                let selectedShape : PokeShape!
                if(searchController.isActive){
                    selectedShape = filteredShapesPoke[indexPath.row]
                }else{
                    selectedShape = pokeShapeList[indexPath.row]
                }
                
                
                tableViewDetail!.selectedShapPoke = selectedShape
                self.tablePokelist.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}

