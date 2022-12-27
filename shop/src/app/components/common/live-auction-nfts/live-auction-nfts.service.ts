import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../../src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class LiveAuctionNftsService {

    private API_URL= environment.API_URL;

    constructor(
        private http : HttpClient
    ) {}

    getData(){
        let url = `${this.API_URL}/nft-items?populate=*&filters[liveAuction][$eq]=true&sort[0]=id%3Adesc`;
        return this.http.get(url);
    }

}