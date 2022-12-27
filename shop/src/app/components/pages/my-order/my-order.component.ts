import { Component, OnInit } from '@angular/core';
import { ProductService } from 'src/app/service/product.service';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';

@Component({
  selector: 'app-my-order',
  templateUrl: './my-order.component.html',
  styleUrls: ['./my-order.component.scss']
})
export class MyOrderComponent implements OnInit {
    lstOrder: any = [];
  constructor(
    private productService: ProductService
  ) { }

  ngOnInit(): void {
    this.getData()
  }
  getData(){

    this.productService.getMyOrder({userName: AuthenticationUtil.getUserName()}).subscribe(res=>{
        console.log(res);
        this.lstOrder = res.data

    })
  }

}
