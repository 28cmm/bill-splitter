//
//  ViewController.m
//  Bill Splitter
//
//  Created by Yilei Huang on 2019-01-20.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountInput;
@property (weak, nonatomic) IBOutlet UITextField *pplInput;
@property (weak, nonatomic) IBOutlet UILabel *amountPay;
@property float tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.amountInput.text =@"0";
    self.pplInput.text =@"0";
    self.tipAmount = .50;
    self.amountInput.delegate =self;
    self.pplInput.delegate =self;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tipSlider:(UISlider*)sender {
    self.tipAmount= sender.value;
    self.tipsLabel.text = [NSString stringWithFormat:@"%f%%",self.tipAmount*100];
    [self calculate];
}

-(void)calculate{
    if(self.pplInput.text.intValue == 0){
        
    }else{
         int result = self.amountInput.text.intValue * (1+self.tipAmount) /self.pplInput.text.intValue;
        self.amountPay.text = [NSString stringWithFormat:@"%i per person",result];
        
    }
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //[self calculate];
    
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
   
    [self calculate];
    [self.pplInput resignFirstResponder];
    return YES;
}


@end
