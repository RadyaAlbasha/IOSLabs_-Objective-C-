//
//  ViewController.m
//  Sync&AsyncLab1
//
//  Created by JETS Mobile Lab - 2 on 4/22/19.
//  Copyright © 2019 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableData *dataReceived;
}
- (IBAction)syncAction:(UIButton *)sender;

- (IBAction)asyncAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)syncAction:(UIButton *)sender {
    NSURL * url = [NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us"];
    NSString *str = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    [_textView setText:str];
    
}

- (IBAction)asyncAction:(UIButton *)sender {
    NSURL * url = [NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("didReceiveResponse\n");
    //3shan btetnada marra wa7da f ansab mkan a3arf hena
    dataReceived = [NSMutableData new];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    printf("didReceiveData\n");
    //3shan el didReceiveData btetnada aktar men marra kol marra bygeb goz2 men el data
    [dataReceived appendData:data];
    
   // NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
   // [_textView setText:str];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // hena hkon mot2akeda eno 3ml load lel data kolha f a3redha
    NSString *str = [[NSString alloc] initWithData:dataReceived encoding:NSUTF8StringEncoding];
    [_textView setText:str];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    printf("didFailWithError\n");
}
@end
