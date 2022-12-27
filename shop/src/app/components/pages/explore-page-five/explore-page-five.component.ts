import { Component, OnInit } from '@angular/core';
import { PopularNftsService } from '../../common/popular-nfts/popular-nfts.service';

@Component({
    selector: 'app-explore-page-five',
    templateUrl: './explore-page-five.component.html',
    styleUrls: ['./explore-page-five.component.scss']
})
export class ExplorePageFiveComponent implements OnInit {

    public nftItemsData: any;

	constructor(
        private content: PopularNftsService
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