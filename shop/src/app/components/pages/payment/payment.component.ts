import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cookie } from 'ng2-cookies';
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
    console.log();
    this.lstProduct = JSON.parse(Cookie.get("lstSelectedProduct"));
    var date = new Date();
        for(var i = 0; i < this.lstProduct.length; i++){
            var startDate = new Date(this.lstProduct[i].START_DATE)
            var endDate = new Date(this.lstProduct[i].END_DATE)
            if(this.lstProduct[i].VALUE && date >= startDate && date <= endDate){
                this.total += (parseInt(this.lstProduct[i].PRICE) * (100 - parseInt(this.lstProduct[i].VALUE)) / 100) * parseInt(this.lstProduct[i].QUANTITY)
            }else{
                this.total += parseInt(this.lstProduct[i].PRICE) * this.lstProduct[i].QUANTITY
            }
        }
  }

  saveOrder(data: any){
    console.log(data)
    data['userId'] = this.userInfo.USER_ID
    data['lstProduct'] = this.lstProduct
    data['total'] = this.total;
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
