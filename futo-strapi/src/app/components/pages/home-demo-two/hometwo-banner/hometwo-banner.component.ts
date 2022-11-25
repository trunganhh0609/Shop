import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { PopularNftsService } from '../../../common/popular-nfts/popular-nfts.service';

@Component({
    selector: 'app-hometwo-banner',
    templateUrl: './hometwo-banner.component.html',
    styleUrls: ['./hometwo-banner.component.scss']
})
export class HometwoBannerComponent implements OnInit {

    public nftItemsData: any;

	constructor(
        private content: PopularNftsService
	) {
		this.content.getData().subscribe((nftItemsData: any) => {
            this.nftItemsData = nftItemsData.data;
        });
	}

    ngOnInit(): void {}

    bannerItemSlides: OwlOptions = {
		nav: false,
		loop: true,
		margin: 25,
		dots: true,
		autoplay: false,
		smartSpeed: 500,
		autoplayHoverPause: true,
		navText: [
			"<i class='ri-arrow-left-s-line'></i>",
			"<i class='ri-arrow-right-s-line'></i>"
		],
		responsive: {
			0: {
				items: 1
			},
			576: {
				items: 1
			},
			695: {
				items: 2
			},
			992: {
				items: 1
			},
			1200: {
				items: 1
			}
		}
    }

}