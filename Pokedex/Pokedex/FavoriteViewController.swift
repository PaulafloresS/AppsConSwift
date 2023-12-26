
import Foundation
import UIKit
class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    @IBOutlet weak var favoritesTableView: UITableView!
    var filteredShapesPoke = [PokeShape]()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar la tabla y cargar los favoritos
        NotificationCenter.default.addObserver(self, selector: #selector(handleFavoritesUpdated), name: NSNotification.Name(rawValue: "FavoritesUpdated"), object: nil)
        initSearchController()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    @objc func handleFavoritesUpdated() {
        // Actualiza la tabla cuando se recibe la notificación de que los favoritos han sido actualizados
        favoritesTableView.reloadData()
    }
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        definesPresentationContext = true
        favoritesTableView.tableHeaderView = searchController.searchBar

        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Numero","Nombre"]
        searchController.searchBar.delegate = self
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive){
            return filteredShapesPoke.count
        }
        return DataManager.shared.favoriteItems.count
    }
  
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Todo") {
        print("Search Text: \(searchText), Scope Button: \(scopeButton)")

        filteredShapesPoke = DataManager.shared.favoriteItems.filter { shape in
            
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

        favoritesTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)

               // Configurar la celda con los detalles del elemento favorito
        let thisShape: PokeShape!

        if searchController.isActive {
            thisShape = filteredShapesPoke[indexPath.row]
        } else {
            thisShape = DataManager.shared.favoriteItems[indexPath.row]
        }
        cell.textLabel?.text = thisShape.id + " " + thisShape.name 
               return cell
    }
    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        // Obtener el elemento seleccionado de la lista de favoritos
        let selectedFavorite = DataManager.shared.favoriteItems[indexPath.row]

        // Obtener una referencia a la vista de detalles desde el storyboard
        self.performSegue(withIdentifier: "detailSegue2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue2" {
            if let indexPath = self.favoritesTableView.indexPathForSelectedRow {
                let tableViewDetail = segue.destination as? TableViewDetail
                let selectedShape : PokeShape!
                if(searchController.isActive){
                    selectedShape = filteredShapesPoke[indexPath.row]
                }else{
                    selectedShape = DataManager.shared.favoriteItems[indexPath.row]
                }
        
                tableViewDetail!.selectedShapPoke = selectedShape
                self.favoritesTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
}

