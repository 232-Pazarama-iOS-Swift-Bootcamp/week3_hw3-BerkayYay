//
//  DetailViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    private let detailView = DetailView()
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.artworkLarge = podcast?.artworkLarge
            detailView.collectionId = podcast?.collectionId
            detailView.collectionName = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
            detailView.isFav = false
        }
    }
    
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.collectionId = music?.collectionId
            detailView.collectionName = music?.trackName
            detailView.artworkLarge = music?.artworkLarge
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.genres = music?.genre
            detailView.trackPrice = music?.trackPrice
        }
    }
    
    var movie: Movie? {
        didSet {
            title = movie?.trackName
            detailView.collectionId = movie?.collectionId
            detailView.collectionName = movie?.trackName
            detailView.artworkLarge = movie?.artworkLarge
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.artistName = movie?.artistName
            detailView.country = movie?.country
            detailView.genres = movie?.genre
            detailView.trackPrice = movie?.trackPrice
        }
    }
    
    var software: Software? {
        didSet {
            title = software?.collectionName
            detailView.collectionId = software?.collectionId
            detailView.collectionName = software?.collectionName
            detailView.artworkLarge = software?.artworkLarge
            detailView.imageView.downloadImage(from: software?.artworkLarge)
            detailView.releaseDate = software?.releaseDate
            detailView.artistName = software?.artistName
            detailView.country = software?.country
            detailView.genres = software?.genre
            detailView.trackPrice = software?.collectionPrice
        }
    }
    
    var ebook: Ebook? {
        didSet {
            title = ebook?.collectionName
            detailView.collectionId = ebook?.collectionId
            detailView.collectionName = ebook?.collectionName
            detailView.artworkLarge = ebook?.artworkLarge
            detailView.imageView.downloadImage(from: ebook?.artworkLarge)
            detailView.releaseDate = ebook?.releaseDate
            detailView.artistName = ebook?.artistName
            detailView.country = ebook?.country
            detailView.genres = ebook?.genre

        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        
    }
}
