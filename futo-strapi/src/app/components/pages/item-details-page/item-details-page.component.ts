import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { environment } from '../../../../../src/environments/environment';

@Component({
    selector: 'app-item-details-page',
    templateUrl: './item-details-page.component.html',
    styleUrls: ['./item-details-page.component.scss']
})
export class ItemDetailsPageComponent implements OnInit {

    public slug: any;
    public nftItemsData : any;
    private API_URL= environment.API_URL;

    constructor(private route: ActivatedRoute, private http:HttpClient ) {
        this.route.params.subscribe((param : any)=>{
            let url = `${this.API_URL}/nft-items?filters[slug][$eq]=${param.slug}&populate=*`;
            let ddd = this.http.get(url);
            ddd.subscribe(res => {
                this.nftItemsData = res;
            });
        });
    }

    ngOnInit(): void {}

}