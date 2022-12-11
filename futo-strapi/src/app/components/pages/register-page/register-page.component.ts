import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from 'src/app/service/user.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-register-page',
  templateUrl: './register-page.component.html',
  styleUrls: ['./register-page.component.scss']
})
export class RegisterPageComponent implements OnInit {
    userData:any ={};
    dob: any = Date();
    submitted: boolean = false;
  constructor(private userService: UserService,
    private router: Router) { }

  ngOnInit(): void {
    this.userData['dob'] = this.dob
  }
  save(invalid:any){
    this.submitted = true;

    console.log(this.userData)
    if(!invalid){
        this.userService.register(this.userData).subscribe(res => {
            console.log(res)
            if(res.existPhone){
                Swal.fire('Lỗi!', 'Số điện thoại này đã tồn tại', 'error')
            }
            if(res.existUserName){
                Swal.fire('Lỗi!', 'Tên đăng nhập này đã tồn tại', 'error')
            }
            if(res.success){
                Swal.fire('Thành công', 'Đăng ký thành công! Tiếp tục đăng nhập', 'success').then(res=>{
                    if(res.isConfirmed){
                        this.router.navigate(["/login"])
                    }
                });
            }
        })
    }

  }
}
