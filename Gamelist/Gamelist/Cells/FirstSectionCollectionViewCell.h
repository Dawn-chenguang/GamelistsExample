//
//  FirstSectionCollectionViewCell.h
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//  ------------------------------------------
//  tableview第一个section中cell里面的collectionView上的CollectionViewCell
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstSectionCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
