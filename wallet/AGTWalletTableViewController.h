//
//  AGTWalletTableViewController.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 6/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;
@interface AGTWalletTableViewController : UITableViewController
-(id)initWithModel:(AGTWallet *)model;
@end
