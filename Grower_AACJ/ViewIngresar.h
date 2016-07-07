//
//  ViewIngresar.h
//  Grower_AACJ
//
//  Created by itosa on 30/06/16.
//  Copyright © 2016 imaginamos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewIngresar : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txvUsuario;

@property (strong, nonatomic) IBOutlet UITextField *txvPassword;

@property (strong, nonatomic) IBOutlet UIView *VwIngresar;
@property (strong, nonatomic) IBOutlet UIView *vwRegistrarse;

@property (strong, nonatomic) IBOutlet UIView *vwEnviarMail;

- (IBAction)btnRegistrarse:(UIButton *)sender;

- (IBAction)btnRecuperar:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnIngresar;

@property (strong, nonatomic) IBOutlet UIButton *btnOutRegistrar;

@property (strong, nonatomic) IBOutlet UIButton *btnOutRecuperar;

-(void) hiddenField;
- (void) visibleField;

- (IBAction)btnCancelar:(UIButton *)sender;

- (IBAction)btnCancelarEnviar:(UIButton *)sender;

@end
