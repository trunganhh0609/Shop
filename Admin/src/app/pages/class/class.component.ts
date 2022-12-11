import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ThienAnConstant } from 'src/app/constants/thien-an.constant';
import { CommonService } from 'src/app/services/common/common.service';
import { AuthenticationUtil } from 'src/app/utils copy/authentication.util';
import { environment } from 'src/environments/environment';


@Component({
  selector: 'app-class',
  templateUrl: './class.component.html',
  styleUrls: ['./class.component.scss']
})
export class ClassComponent implements OnInit {

  lstClass: [] = [];
  page:number = 1;
  userName: string = '';

  constructor(
    private commonService: CommonService,
    private router: Router
) { }

  ngOnInit(): void {
    debugger
    this.userName = AuthenticationUtil.decodeToken().Username;
    this.getClassByIdTeacher(this.userName);
  }


  getClassByIdTeacher(idTeacher: any){
    const param = {
      "QuerryString":"[sp_appTeacher_ListClass] " + idTeacher,
      "PASSWORD": ThienAnConstant.PASSWORD
    }
    this.commonService.getClassByTeacherId(param).subscribe(res=>{
      console.log(res.Content);
      this.lstClass = res.Content;
    })
  }

  listStudent(data:any){
    this.router.navigate(['class/class-detail'], {
      queryParams: {idLop: data.ID_lop, idMon: data.ID_mon, tenMon: data.Ten_mon}
    })
  }
}
