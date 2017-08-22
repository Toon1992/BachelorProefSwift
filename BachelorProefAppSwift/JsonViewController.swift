//
//  JsonViewController.swift
//  BachelorProefAppSwift
//
//  Created by Toon De True on 21/08/2017.
//  Copyright © 2017 Toon De True. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class JsonCell:UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caption: UILabel!
}

class JsonViewController:UICollectionViewController{
    var albumsArr=[Album]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        albumsArr = JsonToAlbum.shared.getAlbums()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return albumsArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JsonCell
        
        let album = albumsArr[indexPath.row]
        cell.caption.text = album.artist
        
        let url = album.url
        cell.imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:"placeholder.png"))
        
        cell.imageView.isUserInteractionEnabled = true
        cell.imageView.adjustsImageWhenAncestorFocused = true
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = albumsArr[indexPath.row];
        
        print(album);
        
        if let controller = storyboard!.instantiateViewController(withIdentifier:"Product") as? ProductViewController{
            controller.fillAlbum(album: album);
            present(controller, animated: true, completion:nil)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "jsonHeaderView", for: indexPath) as! JsonHeaderViewCollectionReusableView
            
            headerView.Header.text = "Top 10 Albums"
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}
