import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { Router } from '@angular/router';
import { LiveAuctionNftsService } from './live-auction-nfts.service';

@Component({
    selector: 'app-live-auction-nfts',
    templateUrl: './live-auction-nfts.component.html',
    styleUrls: ['./live-auction-nfts.component.scss']
})
export class LiveAuctionNftsComponent implements OnInit {

    public nftItemsData: any;

    constructor(
        public router: Router,
        private content: LiveAuctionNftsService
    ) {
		this.content.getData().subscribe((nftItemsData: any) => {
            this.nftItemsData = nftItemsData.data;
        });
	}

    ngOnInit(): void {}

    auctionSlides: OwlOptions = {
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
			895: {
				items: 3
			},
			1200: {
				items: 4
			}
		}
    }

}