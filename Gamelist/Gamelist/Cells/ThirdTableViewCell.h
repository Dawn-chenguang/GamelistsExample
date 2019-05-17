//
//  ThirdTableViewCell.h
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imaegView;

@property (weak, nonatomic) IBOutlet UILabel *GameNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *getBtton;


@end

NS_ASSUME_NONNULL_END
