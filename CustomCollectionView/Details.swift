//
//  Details.swift
//  CustomCollectionView
//
//  Created by 周彥宏 on 2017/6/2.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

class Details: NSObject {
    
    var animals_id:NSNumber!;
    var image:NSData!;
    
    var animal_place:String!; //所在地
    var album_file:String!; //圖片
    
    var animal_id:String!; //流水編號
    var animal_kind:String!; //類型
    var animal_sex:String!; //性別
    var animal_bodytype:String!; //體型
    var animal_colour:String!; //毛色
    var animal_age:String!; //年紀
    
    var animal_sterilization:String!; //是否絕育
    var animal_bacterin:String!; //是否施打疫苗
    var animal_remark:String!; //資料備註
    
    var animal_opendate:String!; //開放認養時間（起）
    var animal_update:String!; //動物資料異動時間
    
    
    var shelter_name:String!; //動物所屬收容所名稱
    var shelter_address:String!; //地址
    var shelter_tel:String!; //電話

}
