import { Component, OnInit } from '@angular/core';
import { PopularNftsService } from '../../common/popular-nfts/popular-nfts.service';

@Component({
  selector: 'app-explore-page-two',
  templateUrl: './explore-page-two.component.html',
  styleUrls: ['./explore-page-two.component.scss']
})
export class ExplorePageTwoComponent implements OnInit {

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