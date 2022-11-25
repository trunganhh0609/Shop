import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PopularNftsService } from './popular-nfts.service';

@Component({
    selector: 'app-popular-nfts',
    templateUrl: './popular-nfts.component.html',
    styleUrls: ['./popular-nfts.component.scss']
})
export class PopularNftsComponent implements OnInit {

    public nftItemsData: any;

	constructor(
        public router: Router,
        private content: PopularNftsService
	) {
		this.content.getData().subscribe((nftItemsData: any) => {
            this.nftItemsData = nftItemsData.data;
        });
	}

    ngOnInit(): void {}

}