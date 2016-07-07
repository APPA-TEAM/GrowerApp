//
//  ViewIngresar.m
//  Grower_AACJ
//
//  Created by itosa on 30/06/16.
//  Copyright © 2016 imaginamos. All rights reserved.
//

#import "ViewIngresar.h"

@interface ViewIngresar ()

@end

@implementation ViewIngresar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    UIImageView *ImageIcono=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [ImageIcono setImage:[UIImage imageNamed:@"people.png"]];
    [ImageIcono setContentMode:UIViewContentModeCenter];
    self.txvUsuario.leftView=ImageIcono;
    self.txvUsuario.leftViewMode=UITextFieldViewModeAlways;
    
    UIImageView *ImageIcoPass=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [ImageIcoPass setImage:[UIImage imageNamed:@"key.png"]];
    [ImageIcoPass setContentMode:UIViewContentModeCenter];
    self.txvPassword.leftView=ImageIcoPass;
    self.txvPassword.leftViewMode=UITextFieldViewModeAlways;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnRegistrarse:(UIButton *)sender {
    
   [self crearTransision:_VwIngresar vistaDos:_vwRegistrarse btnCancelar:NO];

}

- (IBAction)btnRecuperar:(UIButton *)sender {
    
    [self crearTransision:_VwIngresar vistaDos:_vwEnviarMail btnCancelar:NO];
}

- (IBAction)btnCancelar:(UIButton *)sender {
      [self crearTransisionCancelar:_vwRegistrarse vistaDos:_VwIngresar btnCancelar:YES];
}

- (IBAction)btnCancelarEnviar:(UIButton *)sender {
    [self crearTransisionCancelar:_vwEnviarMail vistaDos:_VwIngresar btnCancelar:YES];
}


-(void) crearTransision:(UIView *)vistaOrigen vistaDos:(UIView *)vistaFinal btnCancelar:(BOOL)estado
{
    if (!estado)
        [self hiddenField];
    
    [UIView transitionWithView:vistaOrigen duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
       
        [vistaOrigen addSubview:vistaFinal];
    } completion:^ (BOOL finished){
        if(finished)
        {            if (estado) {
                [self visibleField];
        }else{
            
            [self hiddenField];
        }
            
        }
        
    }];
}


-(void) crearTransisionCancelar:(UIView *)vistaOrigen vistaDos:(UIView *)vistaFinal btnCancelar:(BOOL)estado
{
    if (!estado)
        [self hiddenField];
    
    
   //UIView* viewToRemove=[self.vwRegistrarse viewWithTag:17];
    
   // [self.VwIngresar.layer removeAllAnimations];
    
    
    [_vwRegistrarse removeFromSuperview];
    [_vwEnviarMail removeFromSuperview];
    
    
    [UIView transitionFromView:_vwRegistrarse toView:_VwIngresar duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom completion:nil];
    
    [self visibleField];
    
   /*
   [UIView transitionWithView:_vwRegistrarse duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [_vwRegistrarse addSubview:_VwIngresar];
    } completion:^ (BOOL finished){
        if(finished)
        {
            if (estado) {
                [self visibleField];
            }else
                [self hiddenField];
        }
        
    }];
    */

}


- (void) hiddenField
{
    _txvUsuario.hidden=YES;
    _txvPassword.hidden=YES;
    _btnIngresar.hidden=YES;
    _btnOutRecuperar.hidden=YES;
    _btnOutRegistrar.hidden=YES;

}

- (void) visibleField
{
    _txvUsuario.hidden=NO;
    _txvPassword.hidden=NO;
    _btnIngresar.hidden=NO;
    _btnOutRecuperar.hidden=NO;
    _btnOutRegistrar.hidden=NO;
    
}




@end
