import { Component, Input, OnInit } from '@angular/core';
import { HomePageService } from 'src/app/service/home-page.service';

@Component({
    selector: 'app-connect-wallet-page',
    templateUrl: './connect-wallet-page.component.html',
    styleUrls: ['./connect-wallet-page.component.scss']
})
export class ConnectWalletPageComponent implements OnInit {
    lstPromotionProduct: any = [];
    constructor(
        private homePageService: HomePageService
    ) { }

    ngOnInit(): void {
        this.getData()
    }

    getData(){
        this.homePageService.getDataHome().subscribe(res=>{
            console.log(res)
            this.lstPromotionProduct = res.lstPromotionProduct;
        })
    }

}
