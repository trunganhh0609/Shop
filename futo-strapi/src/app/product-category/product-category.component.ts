import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Cookie } from 'ng2-cookies';
import Swal from 'sweetalert2';
import { NavbarService } from '../service/navbar.service';
import { ProductService } from '../service/product.service';
import { AuthenticationUtil } from '../utils/authentication.util';

@Component({
  selector: 'app-product-category',
  templateUrl: './product-category.component.html',
  styleUrls: ['./product-category.component.scss']
})
export class ProductCategoryComponent implements OnInit {
    maxPrice: any = '';
    lstProduct:any = [];
    title: string = '';
  constructor(
    private route: ActivatedRoute,
        public router: Router,
        private navbarService: NavbarService,
        private productService: ProductService) {
             }

  ngOnInit(): void {
    this.getData()
  }

  async getData(){
    await this.route.queryParams.subscribe(async res =>{
        this.title = res['title'];
        const param = {
            'maxPrice' : this.maxPrice,
            'id' : res['id']
        }
        this.productService.getProductByCategory(param).subscribe(res =>{
            console.log(res);
            this.lstProduct = res.data;
        })
    });
  }
  change(data: any){
    console.log(data);
    this.maxPrice = data;
    this.getData();
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
