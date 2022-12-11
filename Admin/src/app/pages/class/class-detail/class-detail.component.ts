import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ThienAnConstant } from 'src/app/constants/thien-an.constant';
import { CommonService } from 'src/app/services/common/common.service';
import {MatDialog} from '@angular/material/dialog';
import { SettingAttendanceComponent } from '../setting-attendance/setting-attendance.component';
import { QrAttendanceComponent } from '../qr-attendance/qr-attendance.component';
import { AttendanceService } from 'src/app/services/attendance/attendance.service';

@Component({
  selector: 'app-class-detail',
  templateUrl: './class-detail.component.html',
  styleUrls: ['./class-detail.component.scss']
})
export class ClassDetailComponent implements OnInit {
  lstSinhVien: any;
  keySearch : any;
  dataTable: any;
  lesson: number = 1;
  lstLesson = [];
  dataCheckin: any = []
  classInfo: any
  constructor(
    private commonService: CommonService,
    private route: ActivatedRoute,
    public dialog: MatDialog,
    private attendanceService : AttendanceService
    ) { }

  ngOnInit(): void {
    this.getData();

  }

  async getData(){
    console.log(this.lesson);
    this.dataCheckin = []
    this.lstLesson = []
    await this.route.queryParams.subscribe(async res =>{
      this.classInfo = res
      const param = {
        "QuerryString":"[sp_appTeacher_DiemDanhKeHoach_ChiTiet_Load_List]0," + res.idLop +"," + res.idMon + ",'2020-01-01',1,1,1" ,
        "PASSWORD": ThienAnConstant.PASSWORD
      }

      const request = {
        idClass : res.idLop,
        idSubject: res.idMon,
        lesson: this.lesson
      }
      this.attendanceService.getListAttendanceInLesson(request).subscribe(res => {
        console.log(res)
        this.dataCheckin = res.response
      })

      this.commonService.getStudentInClass(param).subscribe(res=>{

        for(var i=0; i<res.Content.length; i++){
          for(var j=0; j<this.dataCheckin.length; j++){
            if(res.Content[i].Ma_sv == this.dataCheckin[j]['USER_ID']){
              res.Content[i]['status'] = this.dataCheckin[j]['STATUS'];
              res.Content[i]['statusName'] = this.dataCheckin[j]['COMM_NAME']
            }
          }
        }
        console.log(res);
        this.lstSinhVien = res.Content;
        this.dataTable = this.lstSinhVien;
        var numBerOfWeeks = this.diff_weeks(new Date(this.lstSinhVien[0].Tu_ngay_ltc),new Date(this.lstSinhVien[0].Den_ngay_ltc))
        var thisWeek = this.diff_weeks(new Date(this.lstSinhVien[0].Tu_ngay_ltc), new Date())
        console.log('thisWeek'+ thisWeek)
        for(var i = 1; i < numBerOfWeeks+1; i++){
          this.lstLesson.push(i);
        }
        console.log(this.lstLesson);
      })
    })
  }
  onSearch(){
    // console.log(this.lstSinhVien)
    // var lstTemp = this.lstSinhVien
    // if(this.keySearch.trim() != ''){
    //   this.dataTable = lstTemp.filter(ele => {
    //   return ele.Ho_ten.includes(this.keySearch);
    //   })
    // }else{lstTemp = this.lstSinhVien}

  }
  openPopup(){
    this.dialog.open(SettingAttendanceComponent,
    {
      width: "600px"
    }
    ).afterClosed().subscribe(res => {

      const data = {
        'week': this.lesson,
        'timeReset' : res.timeReset,
        'timeMinute': res.timeMinute,
        'timeSecond': res.timeSecond,
        'idClass': this.classInfo.idLop,
        'idSubject': this.classInfo.idMon
      }
      this.dialog.open(QrAttendanceComponent,{
        width: '600px',
        data: data
      })
    })
  }
  diff_weeks(dt2 : Date, dt1 : Date)
 {
  var diff =(dt2.getTime() - dt1.getTime()) / 1000;
  diff /= (60 * 60 * 24 * 7);
  return Math.abs(Math.round(diff));
 }


}



