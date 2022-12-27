import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cookie } from 'ng2-cookies';
import { NavbarService } from 'src/app/service/navbar.service';
import { ProductService } from 'src/app/service/product.service';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.scss']
})
export class ShoppingCartComponent implements OnInit {
    lstProduct: any = [];
    total: number = 0;
    srcImg: any = environment.imgURL;
    lstSelected: any = [];
  constructor(
    private productService: ProductService,
    private navbarService: NavbarService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.getData()
  }

  getData(){
    const param = {
        "userId" : AuthenticationUtil.decodeToken().sub
    }
    this.productService.getShoppingCart(param).subscribe(res=>{
    console.log(res.data)
    this.lstProduct = res.data;
    this.countNumberInCart()
    this.caculateTotal()
    });

  }
  changeCart(product:any){

            const param = {
                "userId" : AuthenticationUtil.decodeToken().sub,
                "productId": product.PRODUCT_ID,
                "quantity": product.QUANTITY
            }
            this.productService.changeQuantityInCart(param).subscribe(res=>{
                console.log(res);
                if(res.success){
                    this.countNumberInCart()
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

    addQuantity(item: any){
        console.log(item.QUANTITY);
        item.QUANTITY = parseInt(item.QUANTITY) + 1;
        this.changeCart(item);
        this.caculateTotal();
    }
    reduceQuantity(item: any){
        console.log(item.QUANTITY);
        item.QUANTITY = parseInt(item.QUANTITY) - 1;
        if(parseInt(item.QUANTITY)<=1){
            item.QUANTITY = 1;
        }
        this.changeCart(item);
        this.caculateTotal();
    }

    caculateTotal(){
        this.total = 0;
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

    delete(product:any){
        const params = {
            "productId" : product.PRODUCT_ID,
            "userId" : AuthenticationUtil.decodeToken().sub
        }
        this.productService.deleteProductInCart(params).subscribe(result =>{
            console.log(result)
            this.getData()
        });
    }

    goToPayment(){
        this.lstSelected = []
        this.lstProduct.forEach((element: any) =>{
            if(element.selected == true){
                this.lstSelected.push(element)
            }
        })
        Cookie.set("lstSelectedProduct", JSON.stringify(this.lstSelected))
        this.router.navigate(["/payment"])
    }
}
