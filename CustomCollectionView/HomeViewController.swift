//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by 周彥宏 on 2017/6/2.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit
import AVFoundation


class HomeViewController: UICollectionViewController,PinterestLayoutDelegate {
    
    let documentsFilePath = "\(NSHomeDirectory())/Documents/Data.plist";
    
    //MARK: - default data
    var imageArray = [UIImage]();
    var labelWord:[String] = [];
    
    
    var appdelegate:AppDelegate!;
    //var imageAll2:[UIImage] = [];
    
    @IBOutlet var aCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate = UIApplication.shared.delegate as! AppDelegate;
        
        
        imageInit();
        labelInit();
        

        
        
        (aCollectionView.collectionViewLayout as! PinterestLayout).delegate = self;
        aCollectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        aCollectionView!.backgroundColor = UIColor.darkGray;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: - default data func
    func labelInit(){
        var count = 1;
        for _ in 1...20{
            var label = "我的號碼";
            label += "\(count)";
            labelWord.append(label);
            count += 1;
        }
    }
    
    func imageInit(){
        var count = 1;
        for _ in 1...20{
            if let image = UIImage(named: "bg-\(count)"){
                imageArray.append(image);
                count += 1;
            }
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        
        let image = imageArray[indexPath.row];
        //let image = self.appdelegate.imageAll[indexPath.row];
        let boundingRect = CGRect(x: 0, y: 0, width: withWidth, height: CGFloat(MAXFLOAT));
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect);
        
        return rect.size.height;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return 0;
    }
    
    
    


}

//MARK: - UICollectionViewDataSource

extension HomeViewController{
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 10;
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count;
        //return appdelegate.imageAll.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "123", for: indexPath) as! CollectionCell;
        
        cell.myImageView.image = imageArray[indexPath.row];
        cell.myLabel.text = labelWord[indexPath.row];
        
        //cell.myImageView.image = appdelegate.imageAll[indexPath.row];
        
        return cell;
        
    }
}















