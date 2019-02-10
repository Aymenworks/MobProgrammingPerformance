//
//  ViewController.swift
//  MobProgramming
//
//  Created by Rebouh Aymen on 10/02/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let data = Array(1...400).map { String($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TextCollectionViewCell.self), for: indexPath) as! TextCollectionViewCell
        
        if let url = URL(string: "https://picsum.photos/200/200/?random"), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            let ciImage = CIImage(image: image)!
            let grayscale = ciImage.applyingFilter("CIColorControls",
                                                   parameters: [ kCIInputSaturationKey: 0.0 ])
            cell.imageView.image = UIImage(ciImage: grayscale)
            
        }
       
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
