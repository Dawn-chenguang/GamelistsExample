//
//  Models.h
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//顶部collectionView的数据模型
@interface ModelFirst : NSObject
@property (copy,nonatomic) NSString* type;
@property (copy,nonatomic) NSString* mainTitle;
@property (copy,nonatomic) NSString* subTitle;
@property (copy,nonatomic) NSString* imageName;

+(instancetype)modelWithType:(NSString*)type andMainTitle:(NSString*)miantitle andSubTitle:(NSString*)subTitle andImageName:(NSString*)imageName;
@end

//=========================================

//热门游戏里的数据模型
@interface ModelSecond : NSObject
@property (copy,nonatomic) NSString* imageName1;
@property (copy,nonatomic) NSString* mainTitle1;
@property (copy,nonatomic) NSString* subTitle1;
@property (copy,nonatomic) NSString* buttonAction1;

@property (copy,nonatomic) NSString* imageName2;
@property (copy,nonatomic) NSString* mainTitle2;
@property (copy,nonatomic) NSString* subTitle2;
@property (copy,nonatomic) NSString* buttonAction2;

@property (copy,nonatomic) NSString* imageName3;
@property (copy,nonatomic) NSString* mainTitle3;
@property (copy,nonatomic) NSString* subTitle3;
@property (copy,nonatomic) NSString* buttonAction3;

+(instancetype)modelWithImageName1:(NSString*)ImageName1 andMainTitle1:(NSString*)mainTitle1 andSubTitle1:(NSString*)subTitle1 andBtnAction:(NSString*)Action1 withImageName2:(NSString*)imageName2 andmainTitle2:(NSString*)mainTitle2 andSubTitle2:(NSString*)subTitle2 andBtnAction2:(NSString*)Action2 WithImageName3:(NSString*)imageName3 andMainTitle3:(NSString*)MainTitle3 andSubTitle3:(NSString*)subTitle3 andBtnAction3:(NSString*)Action3;
@end

//=========================================

//第三个SECTION中的模型
@interface ModelThird : NSObject

@property (copy,nonatomic) NSString* imageName;
@property (copy,nonatomic) NSString* gameTitle;
@property (copy,nonatomic) NSString* subTitle;
@property (copy,nonatomic) NSString* btnAction;

+(instancetype)modelWithImageName:(NSString*)imageName andGmeTitle:(NSString*)gameTitle andSubTitle:(NSString*)subTitle andBtnAction:(NSString*)Action;
@end

NS_ASSUME_NONNULL_END
