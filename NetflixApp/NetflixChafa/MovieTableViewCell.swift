//
//  MovieTableViewCell.swift
//  NetflixChafa
//
//  Created by Diplomado on 04/11/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    var model: movieCollectionViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ items: movieCollectionViewModel){
        model = items
    }
}

extension MovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.getMovieCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell else {return UICollectionViewCell()}
        cell.cardImageView.image = UIImage(named: model.getMovieImage(at: indexPath))
        cell.cardTitleLabel.text = model.getMovieTitle(at: indexPath)
        return cell
    }
    
    
}

extension MovieTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width / 3
        return CGSize(width: size, height: 120.0)
        }
}
