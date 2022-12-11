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

import { AttendanceComponent } from './attendance/attendance.component';
import { NgxQRCodeModule } from '@techiediaries/ngx-qrcode';
import { ClassComponent } from './class/class.component';
import { AuthInterceptor } from '../interceptor/interceptor';
import { ClassDetailComponent } from './class/class-detail/class-detail.component';
import { CommonService } from '../services/common/common.service';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import {ToastModule} from 'primeng/toast';

import { SettingAttendanceComponent } from './class/setting-attendance/setting-attendance.component';
import { QrAttendanceComponent } from './class/qr-attendance/qr-attendance.component';
import { UserManagementComponent } from './user-management/user-management.component';
import { UserMngFormComponent } from './user-management/user-mng-form/user-mng-form.component';
import { MessageService } from 'primeng/api';
import { CalendarModule } from 'primeng/calendar';
import { ProductMngComponent } from './product-mng/product-mng.component';
import { ProductMngFormComponent } from './product-mng/product-mng-form/product-mng-form.component';
import { PromotionMngComponent } from './promotion-mng/promotion-mng.component';
import { PromotionFormComponent } from './promotion-mng/promotion-form/promotion-form.component';
import { OrferMngComponent } from './orfer-mng/orfer-mng.component';

FullCalendarModule.registerPlugins([ // register FullCalendar plugins
  dayGridPlugin,
  interactionPlugin,
  bootstrapPlugin
]);

@NgModule({
  declarations: [CalendarComponent, AttendanceComponent, ClassComponent, ClassDetailComponent, SettingAttendanceComponent, QrAttendanceComponent, UserManagementComponent, UserMngFormComponent, ProductMngComponent, ProductMngFormComponent, PromotionMngComponent, PromotionFormComponent, OrferMngComponent],
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
