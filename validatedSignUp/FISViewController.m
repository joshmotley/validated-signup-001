//
//  FISViewController.m
//  validatedSignUp
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) UITextField *chosenTextField;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.email.delegate = self;
    self.userName.delegate = self;
    self.password.delegate = self;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    

    
    NSArray *digitArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSArray *emailArray = @[@".", @"com", @"@"];
    NSString *alertTitle = @"Invalid";
    
    
    if (textField == self.firstName) {
        self.chosenTextField = self.firstName;
        
        if(![self.firstName.text length]>0){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Not long Enough" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [alert show];
            self.lastName.enabled = NO;
            return NO;
        }
        
        for (NSString *digit in digitArray) {
            if ([self.firstName.text containsString:digit]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Your first name cannot contain numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
                [alert show];
                self.lastName.enabled = NO;
                return NO;
            }
        }
        
        self.lastName.enabled = YES;
        [self.firstName resignFirstResponder];
        return YES;
        
    }else  if (textField == self.lastName) {
        
        self.chosenTextField = self.lastName;
        
        if(![self.lastName.text length]>0){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Not long Enough" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [alert show];
            self.email.enabled = NO;
            return NO;
        }
        
        
        for (NSString *digit in digitArray) {
            if ([self.lastName.text containsString:digit]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Your last name cannot contain numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
                [alert show];
                self.email.enabled = NO;
                return NO;
            }
        }
        
        self.email.enabled = YES;
        [self.lastName resignFirstResponder];
        return YES;
        
    }else if (textField == self.email) {
        
        self.chosenTextField = self.email;
        
        if(![self.email.text length]>0){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Not long Enough" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [alert show];
            self.userName.enabled = NO;
            return NO;
        }
        
        for (NSString *symbol in emailArray) {
            if (![self.email.text containsString:symbol]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Must be valid email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
                [alert show];
                self.userName.enabled = NO;
                return NO;
            }
        }
        
        self.userName.enabled = YES;
        [self.email resignFirstResponder];
        return YES;
        
    }else  if (textField == self.userName) {
        
        self.chosenTextField = self.userName;
        
        if(![self.userName.text length]>0){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Not long Enough" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [alert show];
            self.password.enabled = NO;
            return NO;
        }
        
        for (NSString *digit in digitArray) {
            if ([self.userName.text containsString:digit]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Username cannot contain numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
                [alert show];
                self.password.enabled = NO;
                return NO;
            }
        }
        
        self.password.enabled = YES;
        [self.userName resignFirstResponder];
        return YES;
        
    }else  if (textField == self.password) {
        
        self.chosenTextField = self.password;
        
        if([self.password.text length]>6){
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Not long Enough" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [alert show];


            self.submitButton.enabled = NO;
            return NO;
        }
        
   
        [self.password resignFirstResponder];
        self.submitButton.enabled = YES;
        return YES;
        
    }
    

    
    
    
    return NO;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        self.chosenTextField.text = @"";
        
    }
}

@end
