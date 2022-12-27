import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../guards/auth.guard';
import { CategoryMngComponent } from './category-mng/category-mng.component';

import { OrferMngComponent } from './orfer-mng/orfer-mng.component';
import { ProductMngComponent } from './product-mng/product-mng.component';
import { PromotionMngComponent } from './promotion-mng/promotion-mng.component';
import { UserManagementComponent } from './user-management/user-management.component';

const routes: Routes = [
  { path: '', redirectTo: 'product-mng' },

  { path: 'user-mng', component: UserManagementComponent },
  { path: 'product-mng', component: ProductMngComponent },
  { path: 'promotion-mng', component: PromotionMngComponent },
  { path: 'order-mng', component: OrferMngComponent },
  { path: 'category-mng', component: CategoryMngComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PagesRoutingModule { }
