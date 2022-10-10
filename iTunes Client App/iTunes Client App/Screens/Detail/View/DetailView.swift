//
//  DetailView.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit
import CoreData



final class DetailView: UIView {
    
    private var favItems = [NSManagedObject]()
    
    
    var isFav: Bool? = false
    {
        didSet{
            isFav
        }
    }
    var collectionId: Int?{
        didSet{
            collectionId
        }
    }
    var collectionName: String? {
        didSet{
            collectionName
        }
    }
    
    var artworkLarge: URL?{
        didSet{
            artworkLarge
        }
    }
    
    var releaseDate: String? {
        didSet {
            releaseDateKeyLabel.text = "Release Date:"
            releaseDateKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            releaseDateLabel.text = releaseDate ?? "-"
        }
    }
    
    var artistName: String? {
        didSet {
            artistNameKeyLabel.text = "Artist Name:"
            artistNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            artistNameLabel.text = artistName ?? "-"
        }
    }
    
    var country: String? {
        didSet {
            countryKeyLabel.text = "Country:"
            countryKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            countryLabel.text = country ?? "-"
        }
    }
    
    var genres: String? {
        didSet {
            genresKeyLabel.text = "Genres:"
            genresKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            genresLabel.text = genres ?? "-"
        }
    }
    
    var trackPrice: Double? {
        didSet {
            trackPriceKeyLabel.text = "Price:"
            trackPriceKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            guard let trackPrice = trackPrice else{
                return
            }
            trackPriceLabel.text = "\(trackPrice) $"
        }
    }
    
    
    
    
    
    private(set) var imageView = UIImageView()
    
    private let releaseDateKeyLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private lazy var releaseDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateKeyLabel, UIView(), releaseDateLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var artistNameKeyLabel = UILabel()
    private var artistNameLabel = UILabel()
    private lazy var artistNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistNameKeyLabel, UIView(), artistNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var countryKeyLabel = UILabel()
    private var countryLabel = UILabel()
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryKeyLabel, UIView(), countryLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var genresKeyLabel = UILabel()
    private var genresLabel = UILabel()
    private lazy var genresStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [genresKeyLabel, UIView(), genresLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var trackPriceKeyLabel = UILabel()
    private var trackPriceLabel = UILabel()
    private lazy var trackPriceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [trackPriceKeyLabel, UIView(), trackPriceLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
   
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        backgroundColor = .white
        
        releaseDateLabel.numberOfLines = .zero
        artistNameLabel.numberOfLines = .zero
        countryLabel.numberOfLines = .zero
        genresLabel.numberOfLines = .zero
        trackPriceLabel.numberOfLines = .zero
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [releaseDateStackView,
                                                       artistNameStackView,
                                                       countryStackView,
                                                       genresStackView,
                                                       trackPriceStackView])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0)
        ])
        
        let starButton = UIButton()
        starButton.backgroundColor = .lightGray
        starButton.layer.cornerRadius = 25
        starButton.addTarget(self, action: #selector(isFavButtonTapped), for: .touchUpInside)
        starButton.setImage(UIImage(systemName: "heart"), for: .normal)
        addSubview(starButton)
        starButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            starButton.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            starButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            starButton.heightAnchor.constraint(equalToConstant: 50.0)
            
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func isFavButtonTapped( _ sender: UIButton){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let isFav = isFav else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavItems", in: managedContext)
        let favItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        guard let collectionName = collectionName else {
            return
        }
        if  isFav{
            print("Favoriden kaldirildi")
            self.isFav = false
            managedContext.delete(favItem)
            do{
                try managedContext.save()
                print(favItem)
                sender.setImage(UIImage(systemName: "heart"), for: .normal)
            }   catch{
                print("Save process not completed")
            }
        }
        else{
            print("favoriye eklendi")
            favItem.setValue(releaseDate, forKey: "releaseDate")
            favItem.setValue(collectionName, forKey: "collectionName")
            favItem.setValue(artistName, forKey: "artistName")
            favItem.setValue(country, forKey: "country")
            favItem.setValue(artworkLarge, forKey: "artworkUrl")
            favItem.setValue(genres, forKey: "genre")
            favItem.setValue(collectionId, forKey: "id")
            favItem.setValue(true, forKey: "isFav")
            self.isFav = true
            do{
                try managedContext.save()
                print(favItem)
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }   catch{
                print("Save process not completed")
            }
        }
    }
    
    func checkIfItemExist(collectionName: String, managedContext: NSManagedObjectContext) -> Bool {
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavItems")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "collectionName == %@" ,collectionName)
        do {
            let count = try managedContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}
