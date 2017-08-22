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
    }
}
