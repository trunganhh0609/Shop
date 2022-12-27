import { Component, OnInit } from '@angular/core';
import { LiveAuctionNftsService } from '../../common/live-auction-nfts/live-auction-nfts.service';

@Component({
    selector: 'app-live-auction-page',
    templateUrl: './live-auction-page.component.html',
    styleUrls: ['./live-auction-page.component.scss']
})
export class LiveAuctionPageComponent implements OnInit {

    public nftItemsData: any;

    constructor(
        private content: LiveAuctionNftsService
    ) {
		this.content.getData().subscribe((nftItemsData: any) => {
            this.nftItemsData = nftItemsData.data;
        });
	}

    ngOnInit(): void {}

    currentPage : any;
    onPageChange(page: number) {
        this.currentPage = page;
        window.scrollTo(0, 0);
    }

}