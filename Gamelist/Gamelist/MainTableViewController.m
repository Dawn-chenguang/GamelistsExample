//
//  MainTableViewController.m
//  Gamelist
//
//  Created by LCG on 2019/5/16.
//  Copyright © 2019 复习. All rights reserved.
//

#import "MainTableViewController.h"
#import "Model/Models.h" //数据模型
#import "Cells/FirstSectionCollectionViewCell.h" //顶部CollectionViewCell
#import "Cells/SecondSectionCollectionViewCell.h"//热门游戏CollectionViewCell
#import "Cells/ThirdTableViewCell.h"             //自定义的tableViewCell
@interface MainTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

//热门游戏上的查看全部
@property (weak, nonatomic) IBOutlet UIButton *checkAllBtn;

//cell中嵌套的collectionview
@property (weak, nonatomic) IBOutlet UICollectionView *subCollectionView;

//热门游戏栏的collectionView
@property (weak, nonatomic) IBOutlet UICollectionView *midCollectionView;

@property (strong,nonatomic) NSArray<ModelFirst*>  *headArray;//顶部(第一个section)的数据源
@property (strong,nonatomic) NSArray<ModelSecond*> *midArray;//热门游戏里的数据源
@property (strong,nonatomic) NSArray<ModelThird*>  *bottomArray;//最后一个section的数据源

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给cell中的collectionView设置代理
    self.subCollectionView.delegate   = self;
    self.subCollectionView.dataSource = self;
    //给热门游戏中的collectionView设置代理
    self.midCollectionView.delegate   = self;
    self.midCollectionView.dataSource = self;
    [self.checkAllBtn addTarget:self action:@selector(checkAllAction:) forControlEvents:UIControlEventTouchUpInside];
    //注册自定义tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:@"ThirdTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TableViewCell"];
}

#pragma mark - 生成假数据模型数组

-(NSArray<ModelFirst *> *)headArray{
    if (_headArray == nil) {
        _headArray = @[
                       [ModelFirst modelWithType:@"主打推荐" andMainTitle:@"和平精英" andSubTitle:@"升阶精英手册" andImageName:@"1"],
                       [ModelFirst modelWithType:@"重磅推荐" andMainTitle:@"大话西游" andSubTitle:@"新资料片：名师高徒" andImageName:@"2"],
                       [ModelFirst modelWithType:@"独立佳作" andMainTitle:@"Magnibox" andSubTitle:@"玩转正负极小磁铁大冒险" andImageName:@"3"],
                       [ModelFirst modelWithType:@"新关卡" andMainTitle:@"命运" andSubTitle:@"新章节：永久冻土帝国" andImageName:@"4"]
                       ];
    }
    return _headArray;
}
-(NSArray<ModelSecond *> *)midArray{
    if (_midArray == nil) {
        _midArray = @[
                      [ModelSecond modelWithImageName1:@"5" andMainTitle1:@"卡片怪兽" andSubTitle1:@"角色扮演游戏" andBtnAction:@"game" withImageName2:@"6" andmainTitle2:@"巅峰战舰" andSubTitle2:@"日韩通服,10v10" andBtnAction2:@"game" WithImageName3:@"7" andMainTitle3:@"帝国防线:侠盗骑兵" andSubTitle3:@"经典策略塔防" andBtnAction3:@"game"],
                      [ModelSecond modelWithImageName1:@"8" andMainTitle1:@"IMPOSSIBLE ROAD" andSubTitle1:@"休闲游戏" andBtnAction:@"game" withImageName2:@"9" andmainTitle2:@"神武3" andSubTitle2:@"策略游戏" andBtnAction2:@"game" WithImageName3:@"10" andMainTitle3:@"Final Fantasy IX" andSubTitle3:@"冒险游戏" andBtnAction3:@"game"],
                      [ModelSecond modelWithImageName1:@"11" andMainTitle1:@"高尔夫之星" andSubTitle1:@"模拟游戏" andBtnAction:@"game" withImageName2:@"12" andmainTitle2:@"海岛奇兵" andSubTitle2:@"动作游戏" andBtnAction2:@"game" WithImageName3:@"13" andMainTitle3:@"Injustice:Gods Among Us" andSubTitle3:@"动作游戏" andBtnAction3:@"game"]
                      ];
    }
    return _midArray;
}
-(NSArray<ModelThird *> *)bottomArray{
    if (_bottomArray == nil) {
        _bottomArray = @[
                         [ModelThird modelWithImageName:@"14" andGmeTitle:@"石器时代M:网游鼻祖19年经典回归" andSubTitle:@"原始萌宠 青春回合" andBtnAction:@"game"],
                         [ModelThird modelWithImageName:@"15" andGmeTitle:@"战争与征服" andSubTitle:@"二战即是战略沙盘手游" andBtnAction:@"game"],
                         [ModelThird modelWithImageName:@"3" andGmeTitle:@"花园之间" andSubTitle:@"陷入超现实世界" andBtnAction:@"game"]
                         ];
    }
    return _bottomArray;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //前两个SECTION是静态的cell 都每个section只有一个cell
    if (section == 0 || section == 1) {
        return 1;
    }
    //第三个SECTION是动态的cell
    return self.bottomArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {//如果是第三个Section(动态cell)
        ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
        cell.imaegView.image    = [UIImage imageNamed:self.bottomArray[indexPath.row].imageName];
        cell.imaegView.layer.cornerRadius  = 10.0;
        cell.imaegView.layer.masksToBounds = YES;
        cell.GameNameLabel.text = self.bottomArray[indexPath.row].gameTitle;
        cell.subTitleLabel.text = self.bottomArray[indexPath.row].subTitle;
        cell.getBtton.layer.cornerRadius  = 10.0;
        cell.getBtton.layer.masksToBounds = YES;
        
        return cell;
    }else{
        //前两个Section
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}
#pragma mark - 注意一定要重写以下两个方法 不然会崩溃
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [super tableView:tableView indentationLevelForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
    if (indexPath.section == 1) {
        return [super tableView:tableView indentationLevelForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 300;
    }
    if (indexPath.section == 1) {
        return 250;
    }
    return 100;
}
#pragma mark - Collection View  data source
//cell中的collectionView的数据源
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView.tag == 35) {//顶部
        return self.headArray.count;
    }
    if (collectionView.tag == 36) {//热门游戏
        return self.midArray.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //用CollectionView设置Tag区分不同
    if (collectionView.tag == 35) {//顶部collectionView
        FirstSectionCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
        //记得提前给CELL标记identity!
        cell.typeLabel.text      = self.headArray[indexPath.row].type;
        cell.mainTitleLabel.text = self.headArray[indexPath.row].mainTitle;
        cell.subTitleLabel.text  = self.headArray[indexPath.row].subTitle;
        cell.imageView.image     = [UIImage imageNamed:self.headArray[indexPath.row].imageName];
        cell.imageView.layer.cornerRadius  = 10.0;
        cell.imageView.layer.masksToBounds = YES;
        return cell;
    }
    if (collectionView.tag == 36) {//热门游戏collectionView
        SecondSectionCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell2" forIndexPath:indexPath];
        cell.imageView1.image = [UIImage imageNamed:self.midArray[indexPath.row].imageName1];
        cell.imageView1.layer.cornerRadius  = 10.0;
        cell.imageView1.layer.masksToBounds = YES;
        cell.mainTitle1.text  = self.midArray[indexPath.row].mainTitle1;
        cell.subTitle1.text   = self.midArray[indexPath.row].subTitle1;
        //[cell.button1 setValue:self.midArray[indexPath.row].buttonAction1 forKey:@""];
        [cell.button1 addTarget:self action:@selector(cellBtnActionTrigger:) forControlEvents:UIControlEventTouchUpInside];
        cell.button1.layer.cornerRadius  = 10.0;
        cell.button1.layer.masksToBounds = YES;
        
        cell.imageView2.image = [UIImage imageNamed:self.midArray[indexPath.row].imageName2];
        cell.imageView2.layer.cornerRadius  = 10.0;
        cell.imageView2.layer.masksToBounds = YES;
        cell.mainTitle2.text  = self.midArray[indexPath.row].mainTitle2;
        cell.subTitle2.text   = self.midArray[indexPath.row].subTitle2;
        [cell.button2 addTarget:self action:@selector(cellBtnActionTrigger:) forControlEvents:UIControlEventTouchUpInside];
        cell.button2.layer.cornerRadius  = 10.0;
        cell.button2.layer.masksToBounds = YES;
    
        cell.imageView3.image = [UIImage imageNamed:self.midArray[indexPath.row].imageName3];
        cell.imageView3.layer.cornerRadius  = 10.0;
        cell.imageView3.layer.masksToBounds = YES;
        cell.mainTitle3.text  = self.midArray[indexPath.row].mainTitle3;
        cell.subTitle3.text   = self.midArray[indexPath.row].subTitle3;
        [cell.button3 addTarget:self action:@selector(cellBtnActionTrigger:) forControlEvents:UIControlEventTouchUpInside];
        cell.button3.layer.cornerRadius  = 10.0;
        cell.button3.layer.masksToBounds = YES;
        
        return cell;
        
    }
    
    return nil;
}
#pragma mark - 按钮触发
-(void)cellBtnActionTrigger:(UIButton*)btn{
    NSLog(@"%s",__func__);
}
-(void)checkAllAction:(UIButton*)btn{
    NSLog(@"%s",__func__);
}
@end
