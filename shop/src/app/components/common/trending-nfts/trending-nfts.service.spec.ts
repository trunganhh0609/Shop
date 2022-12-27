import { TestBed } from '@angular/core/testing';

import { TrendingNftsService } from './trending-nfts.service';

describe('TrendingNftsService', () => {
  let service: TrendingNftsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TrendingNftsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
