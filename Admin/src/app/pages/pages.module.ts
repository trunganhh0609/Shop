import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { NgbNavModule, NgbDropdownModule, NgbModalModule, NgbTooltipModule , NgbCollapseModule} from '@ng-bootstrap/ng-bootstrap';
import { NgApexchartsModule } from 'ng-apexcharts';
import { NgSelectModule } from '@ng-select/ng-select';

import { FullCalendarModule } from '@fullcalendar/angular';
import { SimplebarAngularModule } from 'simplebar-angular';
import dayGridPlugin from '@fullcalendar/daygrid'; // a plugin
import interactionPlugin from '@fullcalendar/interaction'; // a plugin
import bootstrapPlugin from "@fullcalendar/bootstrap";
import { LightboxModule } from 'ngx-lightbox';

import { WidgetModule } from '../shared/widget/widget.module';
import { UIModule } from '../shared/ui/ui.module';

import { PagesRoutingModule } from './pages-routing.module';

import { DashboardsModule } from './dashboards/dashboards.module';

import { IconsModule } from './icons/icons.module';
import { CalendarComponent } from './calendar/calendar.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { NgxQRCodeModule } from '@techiediaries/ngx-qrcode';
import { AuthInterceptor } from '../interceptor/interceptor';
import { CommonService } from '../services/common/common.service';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import {ToastModule} from 'primeng/toast';

import { UserManagementComponent } from './user-management/user-management.component';
import { UserMngFormComponent } from './user-management/user-mng-form/user-mng-form.component';
import { MessageService } from 'primeng/api';
import { CalendarModule } from 'primeng/calendar';
import { ProductMngComponent } from './product-mng/product-mng.component';
import { ProductMngFormComponent } from './product-mng/product-mng-form/product-mng-form.component';
import { PromotionMngComponent } from './promotion-mng/promotion-mng.component';
import { PromotionFormComponent } from './promotion-mng/promotion-form/promotion-form.component';
import { OrferMngComponent } from './orfer-mng/orfer-mng.component';
import { CategoryMngComponent } from './category-mng/category-mng.component';
import { CategoryFormComponent } from './category-mng/category-form/category-form.component';

FullCalendarModule.registerPlugins([ // register FullCalendar plugins
  dayGridPlugin,
  interactionPlugin,
  bootstrapPlugin
]);

@NgModule({
  declarations: [CalendarComponent, UserManagementComponent, UserMngFormComponent, ProductMngComponent, ProductMngFormComponent, PromotionMngComponent, PromotionFormComponent, OrferMngComponent, CategoryMngComponent, CategoryFormComponent],
  imports: [
    CommonModule,
    FormsModule,
    NgbDropdownModule,
    NgbModalModule,
    PagesRoutingModule,
    NgApexchartsModule,
    ReactiveFormsModule,
    DashboardsModule,
    HttpClientModule,
    UIModule,
    IconsModule,
    WidgetModule,
    FullCalendarModule,
    NgbNavModule,
    NgbTooltipModule,
    NgbCollapseModule,
    SimplebarAngularModule,
    LightboxModule,
    NgxQRCodeModule,
    TableModule,
    ButtonModule,
    ToastModule,
    NgSelectModule,
    CalendarModule


  ],
  providers: [

    CommonService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    },
  ]
})
export class PagesModule { }
