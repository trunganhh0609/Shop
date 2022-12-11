import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../../../src/environments/environment';
import { ProductService } from 'src/app/service/product.service';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { Cookie } from 'ng2-cookies';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
import { MessageService } from 'primeng/api';
import { NavbarService } from 'src/app/service/navbar.service';
import Swal from 'sweetalert2';


@Component({
    selector: 'app-item-details-page',
    templateUrl: './item-details-page.component.html',
    styleUrls: ['./item-details-page.component.scss']
})
export class ItemDetailsPageComponent implements OnInit {
    quantity:number = 1;
    product: any = {};
    lstRelatedProduct:any = [];
    srcImg: any = environment.imgURL;

    feedbackSlides: OwlOptions = {
        items: 4,
		nav: true,
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
    constructor(
        private route: ActivatedRoute,
        public router: Router,
        private messageService: MessageService,
        private navbarService: NavbarService,
        private productService: ProductService) {
            this.route.params.subscribe((param : any)=>{
                console.log(param);
            });
    }

    ngOnInit(): void {
        // window.scrollTo(0, 0);
        this.getData();
    }

    async getData(){
        await this.route.queryParams.subscribe(async res =>{
            this.productService.getProductDetail(res).subscribe(data =>{
                this.quantity = 1;
                this.product = data
                const param = {
                    idCategory: this.product.CATEGORY_ID
                }
                this.productService.getRelatedProduct(param).subscribe(response =>{
                    this.lstRelatedProduct = response;
                    console.log(this.lstRelatedProduct);
                })
            })
        });
    }

    addQuantity(){
        this.quantity += 1;
    }
    reduceQuantity(){
        this.quantity -= 1;
        if(this.quantity<=1){
            this.quantity = 1;
        }
    }
    goToDetail(item:any){
        console.log(item)
        this.router.navigate(["/product-detail"], {queryParams:{id:item.PRODUCT_ID}})
    }

    addToCart(product:any){
        if(Cookie.get('access_token') && !AuthenticationUtil.isTokenExpired()){
            console.log(AuthenticationUtil.decodeToken());
            let qntt = 0
            if(product.isRelated){
                qntt = 1
            }else{
                qntt = this.quantity
            }
            const param = {
                "userId" : AuthenticationUtil.decodeToken().sub,
                "productId": product.PRODUCT_ID,
                "quantity": qntt
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

    showError() {
        this.messageService.add({severity:'error', summary: 'Lỗi', detail: 'Thêm sản phẩm vào giỏ hàng thất bại!'});
    }
    showSuccess() {
        this.messageService.add({severity:'success', summary: 'Success', detail: 'Thêm sản phẩm vào giỏ hàng thành công!'});
    }

}
