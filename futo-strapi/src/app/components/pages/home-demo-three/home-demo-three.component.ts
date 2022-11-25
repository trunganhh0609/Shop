import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { HomePageService } from 'src/app/service/home-page.service';

@Component({
    selector: 'app-home-demo-three',
    templateUrl: './home-demo-three.component.html',
    styleUrls: ['./home-demo-three.component.scss']
})
export class HomeDemoThreeComponent implements OnInit {
    lstPromotionProduct: any = [];
    lstNewProduct: any = [];
    constructor(
        public router: Router,
        private homePageService: HomePageService
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

}
