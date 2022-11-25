import { TestBed } from '@angular/core/testing';

import { LiveAuctionNftsService } from './live-auction-nfts.service';

describe('LiveAuctionNftsService', () => {
  let service: LiveAuctionNftsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LiveAuctionNftsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
