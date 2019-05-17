//
//  Models.m
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//

#import "Models.h"
//顶部collectionView的数据模型
@implementation ModelFirst

+(instancetype)modelWithType:(NSString *)type andMainTitle:(NSString *)miantitle andSubTitle:(NSString *)subTitle andImageName:(NSString *)imageName{
    ModelFirst *model = [[ModelFirst alloc]init];
    model.type      = type;
    model.mainTitle = miantitle;
    model.subTitle  = subTitle;
    model.imageName = imageName;
    return model;
}
@end

//=========================================

//热门游戏里的数据模型
@implementation ModelSecond

+(instancetype)modelWithImageName1:(NSString *)ImageName1 andMainTitle1:(NSString *)mainTitle1 andSubTitle1:(NSString *)subTitle1 andBtnAction:(NSString *)Action1 withImageName2:(NSString *)imageName2 andmainTitle2:(NSString *)mainTitle2 andSubTitle2:(NSString *)subTitle2 andBtnAction2:(NSString *)Action2 WithImageName3:(NSString *)imageName3 andMainTitle3:(NSString *)MainTitle3 andSubTitle3:(NSString *)subTitle3 andBtnAction3:(NSString *)Action3{
    
    ModelSecond *model = [[ModelSecond alloc]init];
    model.imageName1    = ImageName1;
    model.mainTitle1    = mainTitle1;
    model.subTitle1     = subTitle1;
    model.buttonAction1 = Action1;
    
    model.imageName2    = imageName2;
    model.mainTitle2    = mainTitle2;
    model.subTitle2     = subTitle2;
    model.buttonAction2 = Action2;
    
    model.imageName3    = imageName3;
    model.mainTitle3    = MainTitle3;
    model.subTitle3     = subTitle3;
    model.buttonAction3 = Action3;
    return model;
}
@end

//=========================================

//第三个Sction中的模型
@implementation ModelThird

+(instancetype)modelWithImageName:(NSString *)imageName andGmeTitle:(NSString *)gameTitle andSubTitle:(NSString *)subTitle andBtnAction:(NSString *)Action{
    ModelThird* model = [[ModelThird alloc]init];
    model.imageName = imageName;
    model.gameTitle = gameTitle;
    model.subTitle  = subTitle;
    model.btnAction = Action;
    return model;
}
@end
