import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MessageService } from 'primeng/api';
import { UserManageService } from 'src/app/services/user-mng/user-manage.service';
import Swal from 'sweetalert2';
import { UserMngFormComponent } from './user-mng-form/user-mng-form.component';

@Component({
  selector: 'app-user-management',
  templateUrl: './user-management.component.html',
  styleUrls: ['./user-management.component.scss']
})
export class UserManagementComponent implements OnInit {
  lstUser: any =[];
  constructor(
    private dialog: MatDialog,
    private userMngService: UserManageService,
    private messageService: MessageService,

  ) { }

  ngOnInit(): void {
    this.getLstUser()
  }

  getLstUser(){
    this.userMngService.getLstUser().subscribe(res=>{
      console.log(res)
      this.lstUser = res
    })
  }
  addUser(){
    this.dialog.open(UserMngFormComponent,{
      width: '700px'
    }).afterClosed().subscribe(res =>{
      if(res.existUserName){
        this.showError("Tài khoản đã tồn tại");
      }else if(res.success == 1){
        this.showSuccess("Thêm người dùng thành công");
      }else{this.showError("Thêm người dùng thất bại");}
      this.getLstUser()
    })
  }

  edit(item:any){
    this.dialog.open(UserMngFormComponent,
      {
        width: '700px',
        data: item
      }).afterClosed().subscribe(res =>{
        if(res.success == 1){
          this.showSuccess("Cập nhật người dùng thành công");
        }else{this.showError("Cập nhật người dùng thất bại");}
        this.getLstUser()
      })
  }

  delete(item:any){
    Swal.fire({
      title: 'Block người dùng?',
      text: "Bạn có chắc chắn muốn block?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        this.userMngService.blockUser({userId:item.USER_ID}).subscribe(res =>{
          if(res.success){
            this.showSuccess("Block người dùng thành công")
            this.getLstUser()
          }else{this.showError("Block người dùng thất bại")}
        })
      }
    })

  }

  active(item:any){
    Swal.fire({
      title: 'Active người dùng?',
      text: "Bạn có chắc chắn muốn active?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        this.userMngService.activeUser({userId:item.USER_ID}).subscribe(res =>{
          if(res.success){
            this.showSuccess("Active người dùng thành công")
            this.getLstUser()
          }else{this.showError("Active người dùng thất bại")}
        })
      }
    })
  }

  showSuccess(message:any) {
    this.messageService.add({severity:'success', summary: 'Success', detail: message});
  }

  showError(message:any) {
    this.messageService.add({severity:'error', summary: 'Lỗi', detail: message});
  }
}
