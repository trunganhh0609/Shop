import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { UserManageService } from 'src/app/services/user-mng/user-manage.service';

@Component({
  selector: 'app-user-mng-form',
  templateUrl: './user-mng-form.component.html',
  styleUrls: ['./user-mng-form.component.scss']
})
export class UserMngFormComponent implements OnInit {
  submitted: boolean = false
  dataUser:any = {}
  changePwdIsShow: boolean = false
  dob: Date;
  constructor(
    private dialogRef: MatDialogRef<UserMngFormComponent>,
    private userMngService: UserManageService,
    @Inject(MAT_DIALOG_DATA) public data
  ) { }

  ngOnInit(): void {
    if(this.data){
      this.dataUser['userId'] = this.data.USER_ID;
      this.dataUser['userName'] = this.data.USER_NAME;
      this.dataUser['fullName'] = this.data.FULL_NAME;
      this.dataUser['dob'] = new Date(this.data.BIRTH_DATE);
      this.dataUser['phone'] = this.data.PHONE_NUMBER;
      this.dataUser['role'] = this.data.ROLE;
      console.log(this.dataUser);
    }else{
      this.dataUser['role'] = '1'
    }
    console.log(this.data)
  }
  submit(){
    this.submitted = true;
    console.log(this.dob);
    this.dataUser.dob = this.format(new Date(this.dataUser.dob))
    if(this.data){
      console.log(this.dataUser)
      // this.dataUser.dob = new Date(this.dataUser.dob).toLocaleDateString()
      this.userMngService.updateUser(this.dataUser).subscribe(res=>{
        console.log(res)
        this.dialogRef.close(res)
      })
    }else{
      this.userMngService.addUser(this.dataUser).subscribe(res=>{
        console.log(res)
        this.dialogRef.close(res)
      })
    }

  }
  closePopup(){
    this.dialogRef.close()
  }

  format(inputDate: Date) {
    let date, month, year;

    date = inputDate.getDate();
    month = inputDate.getMonth() + 1;
    year = inputDate.getFullYear();

      date = date
          .toString()
          .padStart(2, '0');

      month = month
          .toString()
          .padStart(2, '0');

    return `${year}/${month}/${date}`;
  }
  changeDate(date: any){
    this.dataUser.dob = date.target.valueAsDate;
  }
}
