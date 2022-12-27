import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { Router } from '@angular/router';
import { TrendingNftsService } from './trending-nfts.service';

@Component({
    selector: 'app-trending-nfts',
    templateUrl: './trending-nfts.component.html',
    styleUrls: ['./trending-nfts.component.scss']
})
export class TrendingNftsComponent implements OnInit {

    public nftItemsData: any;

    constructor(
        public router: Router,
        private content: TrendingNftsService
    ) {
		this.content.getData().subscribe((nftItemsData: any) => {
            this.nftItemsData = nftItemsData.data;
        });
	}

    ngOnInit(): void {}

    trendingSlides: OwlOptions = {
		nav: true,
		loop: true,
		margin: 25,
		dots: false,
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
			515: {
				items: 1
			},
			695: {
				items: 2
			},
			935: {
				items: 3
			},
			1200: {
				items: 4
			}
		}
    }

}