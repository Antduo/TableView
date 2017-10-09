//
//  DetailModel.h
//  TableViewTest
//
//  Created by Saltedfish on 2017/10/8.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject
@property (nonatomic,copy) NSString *ref_spu_id;// ref_spu_id
@property (nonatomic,copy) NSString *spu_name;// spu_name
@property (nonatomic,copy) NSString *spu_img;// spu_img
@property (nonatomic,copy) NSString *spu_reatil_price_range;// spu_reatil_price_range
@property (nonatomic,copy) NSString *spu_retail_price;// spu_retail_price
@property (nonatomic,copy) NSString *max_spu_retail_price;// stringmax_spu_retail_price
@property (nonatomic,copy) NSString *brand_id;// brand_id
@property (nonatomic,copy) NSString *activity;// activity
@property (nonatomic,copy) NSString *start_time;// start_time
@property (nonatomic,copy) NSString *end_time;// end_time
@property (nonatomic,copy) NSString *icon_url;// icon_url
/*
 ref_spu_id: 5530,
 spu_name: "BFB碳纤 宝马 BMW 3系 F35 长轴版 适用年份：2013- 碳纤维车门饰条 4件套（前车门内饰条2件、后车门内饰条2件） 粘贴式安装",
 spu_img: "http://image.pppcar.com/BFBtanxianwei/common/110100000010/show/1496652347345.jpg",
 spu_reatil_price_range: "1540",
 spu_retail_price: 1540,
 max_spu_retail_price: 1540,
 brand_id: 77,
 activity: 0,
 start_time: 0,
 end_time: 0,
 icon_url: ""
 */
@end
