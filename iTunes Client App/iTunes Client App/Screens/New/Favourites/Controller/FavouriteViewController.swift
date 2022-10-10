//
//  FavouriteViewController.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 10.10.2022.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController {

    // MARK: - Properties
    private let favouriteView = FavouriteView()
    private let networkService = BaseNetworkService()
    private var favourites: [NSManagedObject]? {
        didSet {
            favouriteView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        view = favouriteView
        favouriteView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavItems")
        
        do {
            self.favourites = try managedContext.fetch(fetchRequest)
        } catch{
            print(error.localizedDescription)
        }
        
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension FavouriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//                let detailViewController = DetailViewController()
//                detailViewController.favourite = favourites?.results?[indexPath.row]
//                navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}

// MARK: - UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favourites?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavouriteCollectionViewCell
        let fav = favourites?[indexPath.row]
        cell.title = fav?.value(forKey: "collectionName") as? String
        cell.imageView.downloadImage(from: fav?.value(forKey: "artworkUrl") as? URL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension FavouriteViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
//            fetchEbooks(with: text)
        }
        
        
    }
}
