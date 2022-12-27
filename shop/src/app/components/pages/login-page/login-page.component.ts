import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/service/authentication.service';
import { ToastModule } from 'primeng/toast';
import { MessageService } from 'primeng/api';
import { Router } from '@angular/router';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.scss']
})
export class LoginPageComponent implements OnInit {
    userName: string = '';
    password: string = '';
  constructor(
    private auhtService: AuthenticationService,
    private messageService: MessageService,
    private router: Router

  ) { }

  ngOnInit(): void {
  }

  login(){
    const param = {
        'userName': this.userName,
        'password': this.password
    }
    this.auhtService.logIn(param).subscribe(result => {
        console.log(result);
        if(result.jwt){
            AuthenticationUtil.saveToken(result.jwt)
            if(result.Data.role != '0'){
                this.router.navigate(['/'])
            }else{
                window.location.href = "http://localhost:4300/";
            }

        }else{
            this.showError();
        }

    })
  }
  showError() {
    this.messageService.add({severity:'error', summary: 'Lỗi', detail: 'Tài khoản hoặc mật khẩu không chính xác'});
}

}
