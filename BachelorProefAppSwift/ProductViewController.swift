//
//  ProductViewController.swift
//  BachelorProefAppSwift
//
//  Created by Toon De True on 22/08/2017.
//  Copyright © 2017 Toon De True. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var imageAlbum: UIImageView!
    
    var album:Album?
    var albumsArr:[Album]?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fillPage()
        albumsArr = JsonToAlbum.shared.getAlbums();
    }
    
    
    public func fillAlbum(album: Album){
        self.album = album
    }
    
    private func fillPage(){
        titlelbl.text = album?.title;
        artistLbl.text = "Made by " + (album?.artist)!;
        imageAlbum.sd_setImage(with: URL(string: (album?.url)!), placeholderImage: UIImage(named:"placeholder.png"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (albumsArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JsonCell
        cell.caption.text = albumsArr?[indexPath.row].artist;
        
        cell.imageView.sd_setImage(with: URL(string: (albumsArr?[indexPath.row].url)!), placeholderImage: UIImage(named:"placeholder.png"))
        
        cell.imageView.isUserInteractionEnabled = true
        cell.imageView.adjustsImageWhenAncestorFocused = true

        
        return cell
    }
    
    
}
