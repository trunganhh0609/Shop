import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MessageService } from 'primeng/api';
import { AuthenticationService } from 'src/app/service/authentication.service';
import { NavbarService } from 'src/app/service/navbar.service';
import { ProductService } from 'src/app/service/product.service';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.scss']
})
export class PaymentComponent implements OnInit {
    userInfo:any = {};
    total: number = 0;
    lstProduct: any = [];
  constructor(
    private authService: AuthenticationService,
    private productService: ProductService,
    private messageService: MessageService,
    private router: Router,
    private navbarService: NavbarService
  ) { }

  ngOnInit(): void {
    this.getUserInfo()
    this.getTotal();
  }

  getUserInfo(){
    this.authService.getUserInfo({userName: AuthenticationUtil.decodeToken().sub}).subscribe(res => {
        console.log(res);
        this.userInfo = res
    })
  }
  getTotal(){
    const param = {
        "userId" : AuthenticationUtil.decodeToken().sub
    }
    this.productService.getShoppingCart(param).subscribe(res=>{
    console.log(res.data)
    this.lstProduct = res.data;
    var date = new Date();
        for(var i = 0; i < res.data.length; i++){
            var startDate = new Date(res.data[i].START_DATE)
            var endDate = new Date(res.data[i].END_DATE)
            if(res.data[i].VALUE && date >= startDate && date <= endDate){
                this.total += (parseInt(res.data[i].PRICE) * (100 - parseInt(res.data[i].VALUE)) / 100) * parseInt(res.data[i].QUANTITY)
            }else{
                this.total += parseInt(res.data[i].PRICE) * res.data[i].QUANTITY
            }
        }
    });

  }

  saveOrder(data: any){
    console.log(data)
    data['userId'] = this.userInfo.USER_ID
    data['lstProduct'] = this.lstProduct
    this.productService.saveOrder(data).subscribe(res =>{
        console.log(res);
        if(res.success){
            this.countNumberInCart()
            Swal.fire('Thành công', 'Đặt hàng thành công!', 'success').then(res=>{
                if(res.isConfirmed){
                    this.router.navigate(["/"])
                }
            });
        }

    })
  }
  countNumberInCart(){
    let number = 0;
    const param = {
        "userId" : AuthenticationUtil.decodeToken().sub
    }
    this.productService.getShoppingCart(param).subscribe(res=>{
        console.log(res.data)
        for(let i=0; i<res.data.length; i++){
            number += parseInt(res.data[i].QUANTITY);
        }
        console.log(number)
        this.navbarService.changeNumberInCart(number);
    })

  }

}
