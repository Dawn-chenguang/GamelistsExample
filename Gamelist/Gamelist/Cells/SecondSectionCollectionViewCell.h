//
//  SecondSectionCollectionViewCell.h
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondSectionCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle1;
@property (weak, nonatomic) IBOutlet UILabel *subTitle1;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle2;
@property (weak, nonatomic) IBOutlet UILabel *subTitle2;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle3;
@property (weak, nonatomic) IBOutlet UILabel *subTitle3;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@end

NS_ASSUME_NONNULL_END
