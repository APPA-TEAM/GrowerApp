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
    //Inicializa las imagenes en los textField de las vistas.
    [self cargarImagenes:self.txvUsuario imagen:@"people.png"];
    
    [self cargarImagenes:self.txvPassword imagen:@"key.png"];
    
    [self cargarImagenes:self.txtRegUser imagen:@"people.png"];
    
    [self cargarImagenes:self.txtRegPassword imagen:@"key.png"];
    
    [self cargarImagenes:self.txtRegPassConf imagen:@"key.png"];
    
    [self cargarImagenes:self.txtEmail imagen:@"email.png"];
    
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

- (IBAction)actionUserText:(id)sender {
    [self moveKeyBoard:YES];
}

- (IBAction)actionUserTxtOff:(id)sender {
    [self moveKeyBoard:NO];
}

- (IBAction)actionPassTxtOn:(id)sender {
     [self moveKeyBoard:YES];
}

- (IBAction)actionPassTxtOff:(id)sender {
    [self moveKeyBoard:NO];
}

- (IBAction)actionTxtRegUser:(id)sender {
    [self moveKeyBoard:YES];
}

- (IBAction)actionTxtRegUserOff:(id)sender {
    [self moveKeyBoard:NO];
}

- (IBAction)actionTxtPassOn:(id)sender {
    [self moveKeyBoard:YES];
}

- (IBAction)actionPassOff:(id)sender {
    [self moveKeyBoard:NO];
}

- (IBAction)actionPassConfOn:(id)sender {
    [self moveKeyBoard:YES];
}

- (IBAction)actionPassConfOff:(id)sender {
    [self moveKeyBoard:NO];
}

- (IBAction)actionTxtEmailOn:(id)sender {
    [self moveKeyBoard:YES];
}

- (IBAction)actionTxtEmailOff:(id)sender {
     [self moveKeyBoard:NO];
}

-(void)touchesBegan:(NSSet<UITouch *>*)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    //[self.txvPassword endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void) moveKeyBoard:(BOOL) up
{
    const int movementDistance = 200; // lo que sea necesario, en mi caso yo use 80
    const float movementDuration = 0.3f; // lo que sea necesario
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
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
    
    
    [_vwRegistrarse removeFromSuperview];
    [_vwEnviarMail removeFromSuperview];
    
    
    [UIView transitionFromView:_vwRegistrarse toView:_VwIngresar duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom completion:nil];
    
    [self visibleField];
}

-(void) cargarImagenes:(UITextField *)txtField imagen:( NSString*)imagenCargar
{
    UIImageView *ImageIcono=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [ImageIcono setImage:[UIImage imageNamed:imagenCargar]];
    [ImageIcono setContentMode:UIViewContentModeCenter];
    txtField.leftView=ImageIcono;
    txtField.leftViewMode=UITextFieldViewModeAlways;
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
