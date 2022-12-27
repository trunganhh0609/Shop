import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cookie } from 'ng2-cookies';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { HomePageService } from 'src/app/service/home-page.service';
import { NavbarService } from 'src/app/service/navbar.service';
import { ProductService } from 'src/app/service/product.service';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
import { environment } from 'src/environments/environment';
import Swal from 'sweetalert2';

@Component({
    selector: 'app-home-demo-three',
    templateUrl: './home-demo-three.component.html',
    styleUrls: ['./home-demo-three.component.scss']
})
export class HomeDemoThreeComponent implements OnInit {
    lstPromotionProduct: any = [];
    lstNewProduct: any = [];
    srcImg: any = environment.imgURL;
    constructor(
        public router: Router,
        private homePageService: HomePageService,
        private productService: ProductService,
        private navbarService: NavbarService
    ) { }
    feedbackSlides: OwlOptions = {
        items: 3,
		nav: false,
		loop: true,
		margin: 25,
		dots: true,
		autoplay: true,
		smartSpeed: 500,
		autoplayHoverPause: true,
		navText: [
			"<i class='ri-arrow-left-s-line'></i>",
			"<i class='ri-arrow-right-s-line'></i>"
		]
    }
    ngOnInit(): void {
        this.getData()
    }

    getData(){
        this.homePageService.getDataHome().subscribe(res=>{
            console.log(res)
            this.lstPromotionProduct = res.lstPromotionProduct;
            this.lstNewProduct = res.lstNewProduct;
        })
    }
    goToDetail(item:any){
        console.log(item)
        this.router.navigate(["/product-detail"], {queryParams:{id:item.PRODUCT_ID}})
    }

    addToCart(product:any){
        if(Cookie.get('access_token') && !AuthenticationUtil.isTokenExpired()){
            console.log(AuthenticationUtil.decodeToken());

            const param = {
                "userId" : AuthenticationUtil.decodeToken().sub,
                "productId": product.PRODUCT_ID,
                "quantity": 1
            }
            this.productService.addToCart(param).subscribe(res=>{
                console.log(res);
                if(res.success){
                    Swal.fire('Thành công', 'Đã thêm sản phẩm vào giỏ hàng!', 'success')
                    this.countNumberInCart()
                }else{
                    Swal.fire('Thất bại', 'Thêm sản phẩm vào giỏ hàng thất bại!', 'error')
                }

            })
        }else{
            this.router.navigate(['/login'])
        }
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
