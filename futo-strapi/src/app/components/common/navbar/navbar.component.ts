import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cookie } from 'ng2-cookies';
import { AuthenticationService } from 'src/app/service/authentication.service';
import { NavbarService } from 'src/app/service/navbar.service';
import { ProductService } from 'src/app/service/product.service';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';

@Component({
    selector: 'app-navbar',
    templateUrl: './navbar.component.html',
    styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {
    numberInCart : number = 0 ;
    constructor(
        private authService: AuthenticationService,
        private navbarService: NavbarService,
        private productService: ProductService,
        private router: Router
    ) { }

    ngOnInit(): void {
        if(this.isLoggedIn()){
            this.countNumberInCart();
        }

        this.navbarService.currentNumber.subscribe(data =>{
            this.numberInCart = data;
        })

    }

    classApplied = false;
    toggleClass() {
        this.classApplied = !this.classApplied;
    }
    logout(){
        this.authService.logout();
        this.router.navigate(['/'])
    }

    isLoggedIn(){
        return Cookie.get("access_token") && !AuthenticationUtil.isTokenExpired()
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
    goToPC(data: any, name: string){
        this.router.navigate(["/product-category"],{queryParams: {id : data, title: name}})
    }

}
