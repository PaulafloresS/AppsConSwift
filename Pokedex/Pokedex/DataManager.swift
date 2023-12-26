import Foundation
import UIKit
class DataManager {
    static let shared = DataManager()

    private let userDefaults = UserDefaults.standard

    var allItems: [PokeShape] = []
    var favoriteItems: [PokeShape] {
        get {
            if let data = userDefaults.data(forKey: "favoriteItems"),
                let decodedItems = try? JSONDecoder().decode([PokeShape].self, from: data) {
                return decodedItems
            }
            return []
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encodedData, forKey: "favoriteItems")
            }
        }
    }

    private init() {
        // Configura modelo de datos, carga elementos, etc.
        let initialItem = PokeShape(id: "001", name: "Bulbasaur", imageName: "bulbasaur")
          allItems.append(initialItem)
    }

    func saveFavorites() {
        // Guarda la lista de elementos favoritos en UserDefaults
        userDefaults.synchronize()
    }
}

