//
//  ProductViewController.swift
//  BachelorProefAppSwift
//
//  Created by Toon De True on 22/08/2017.
//  Copyright © 2017 Toon De True. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController:UIViewController{
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var imageAlbum: UIImageView!
    
    var album:Album?;
    
    override func viewDidLoad(){
        super.viewDidLoad();
        fillPage();
    }
    
    
    public func fillAlbum(album: Album){
        self.album = album;
    }
    
    private func fillPage(){
        titlelbl.text = album?.title;
        artistLbl.text = "Made by " + (album?.artist)!;
        imageAlbum.sd_setImage(with: URL(string: (album?.url)!), placeholderImage: UIImage(named:"placeholder.png"))
    }
}
