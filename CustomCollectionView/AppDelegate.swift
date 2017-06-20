//
//  AppDelegate.swift
//  CustomCollectionView
//
//  Created by 周彥宏 on 2017/6/2.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let path = "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx";
    
    //sandbox 路徑
    let documentsFilePath = "\(NSHomeDirectory())/Documents/Data.plist";
    
    
    var imageAll:[UIImage] = [];

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let fileManager = FileManager.default;
        print(documentsFilePath);
        
        if fileManager.fileExists(atPath: documentsFilePath) == false{
            if (fileManager.createFile(atPath: documentsFilePath, contents: nil, attributes: nil) == false){
                print("建立失敗");
            }else{
                print("建立成功");
                getJsonData();
                
                
            }
        }
        
        
//        let myPath = NSDictionary(contentsOfFile: documentsFilePath) as! [String:AnyObject];
//
//        let session = URLSession.shared;
//        if let dic = myPath["albumFile"]{
//            let strs = dic as? [String];
//            for str in strs!{
//                var url:URL!;
//
//                if str == ""{
//                    url = URL(string: "http://www.sirdp.org.tw/images/nopic.jpg");
//                }else{
//                    url = URL(string: str);
//                }
//                let downloadTask:URLSessionDownloadTask = session.downloadTask(with: url, completionHandler: { (url:URL?, response:URLResponse?, error:Error?) in
//                    if error != nil{
//                        print("連線有問題");
//                        return;
//                    }
//
//                    if (response as? HTTPURLResponse)?.statusCode != 200{
//                        print("123123");
//                        return;
//                    }
//
//                    if url != nil{
//                        if let receiveData = try? Data(contentsOf:url!){
//                            if let image = UIImage(data: receiveData){
//                                DispatchQueue.main.async {
//                                    self.imageAll.append(image);
//                                }
//                            }
//                        }
//                    }
//                })
//                downloadTask.resume();
//
//            }
//
//
//        }
        


        return true
    }
    
    
    func getJsonData(){
        let url = URL(string: path);
        let mutableRequest = NSMutableURLRequest(url: url!);
        let session = URLSession.shared;
        
        let task = session.dataTask(with: mutableRequest as URLRequest) {
            (data:Data?, request:URLResponse?, error:Error?) in
            if error != nil{
                print("error");
                return;
            }
            print("get data");
            //
            self.parseJson(jsonData: data!);
            
        }
        
        
        task.resume();
    }
    
    func parseJson(jsonData:Data){
        do{
            let dataDic = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]];
            let jsons = dataDic;
            
            var placeArray:[String] = [];
            var kindArray:[String] = [];
            var sexArray:[String] = [];
            var bodyArray:[String] = [];
            var colorArray:[String] = [];
            var ageArray:[String] = [];
            var sterilizationArray:[String] = [];
            var bacterinArray:[String] = [];
            var remarkArray:[String] = [];
            var shelterNArray:[String] = [];
            var shelterAArray:[String] = [];
            var shelterTArray:[String] = [];
            var albumArray:[String] = [];
            
            for json in jsons{
                let place = json["animal_place"] as! String;
                let kind = json["animal_kind"] as! String;
                let sex = json["animal_sex"] as! String;
                let body = json["animal_bodytype"] as! String;
                let color = json["animal_colour"] as! String;
                let age = json["animal_age"] as! String;
                let sterilization = json["animal_sterilization"] as! String;
                let bacterin = json["animal_bacterin"] as! String;
                let remark = json["animal_remark"] as! String;
                let shelterName = json["shelter_name"] as! String;
                let shelterAddress = json["shelter_address"] as! String;
                let shelterTel = json["shelter_tel"] as! String;
                let albumFile = json["album_file"]as! String;
                
                placeArray.append(place);
                kindArray.append(kind);
                sexArray.append(sex);
                bodyArray.append(body);
                colorArray.append(color);
                ageArray.append(age);
                sterilizationArray.append(sterilization);
                bacterinArray.append(bacterin);
                remarkArray.append(remark);
                shelterNArray.append(shelterName);
                shelterAArray.append(shelterAddress);
                shelterTArray.append(shelterTel);
                albumArray.append(albumFile);
            }
            

            
            let plistDictionary = ["place":placeArray,"kind":kindArray,"sex":sexArray,"body":bodyArray,"color":colorArray,"age":ageArray,"sterilization":sterilizationArray,"bactern":bacterinArray,"remark":remarkArray,"shelterName":shelterNArray,"shelterAddress":shelterAArray,"shelter_tel":shelterTArray,"albumFile":albumArray] as NSDictionary;
            
            plistDictionary.write(toFile: documentsFilePath, atomically: true);
            

            
            
            
            print("json parse OK!!");
            
            
            
            
        }catch{
            print("json parse ERROR!!");
        }
        
    }

    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

