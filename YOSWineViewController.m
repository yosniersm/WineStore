//
//  YOSWineViewController.m
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import "YOSWineViewController.h"



@implementation YOSWineViewController


#pragma mark - Init

-(id) initWithModel: (YOSWineModel *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil])
    {
        _model = aModel;
        self.title = aModel.name;
    }
    
    return self;
    
}


// Mantiene sincronizado modelo y vista.
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self syncModelToView];
}


//-(void) viewWillDisappear:(BOOL)animated
//{
//    [super viewWillAppear:<#animated#>];
//}



// Cuando el sistema operativo se da cuenta que se esta quedando sin memoria, envia un mensaje a este metodo.
// Lo que se hace aqui es eliminar todo aquello que no necesites.
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Actions

-(IBAction)displayWeb:(id)sender{
    NSLog(@"Go to %@",self.model.webCompany);
}


#pragma mark - Utils

-(void) syncModelToView{
    
    self.lbName.text = self.model.name;
    self.lbType.text = self.model.type;
    self.lbOrigin.text = self.model.origin;
    self.lbNotes.text = self.model.notes;
    self.lbWineCompanyName.text = self.model.wineCompanyName;
    self.imPhotoView.image = self.model.photo;
    self.lbGrapes.text = [self displayArraytoString:self.model.grapes];
    
    [self displayRating:self.model.rating];
    [self.lbNotes setNumberOfLines:0];

    
}


-(NSString *)displayArraytoString: (NSArray *) arrayGrapes{
    
    NSString *rep = nil;
    
    if ([arrayGrapes count] == 1){
        rep = [@"100% " stringByAppendingString:[arrayGrapes lastObject]];
    } else{
        rep = [[arrayGrapes componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return rep;
}


-(void) clearRating{
    for (UIImageView *imView in self.imRating) {
        imView.image = nil;
    }
}

-(void)displayRating: (int) pRating{
    
    [self clearRating];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    
    for (int i=0; i < pRating; i++) {
        [[self.imRating objectAtIndex:i] setImage:glass];
    }
    
}













@end
