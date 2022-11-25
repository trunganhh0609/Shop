import { Component, OnInit } from '@angular/core';
import { PopularNftsService } from '../../common/popular-nfts/popular-nfts.service';

@Component({
  selector: 'app-explore-page-three',
  templateUrl: './explore-page-three.component.html',
  styleUrls: ['./explore-page-three.component.scss']
})
export class ExplorePageThreeComponent implements OnInit {

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