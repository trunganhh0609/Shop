import { TestBed } from '@angular/core/testing';

import { PopularNftsService } from './popular-nfts.service';

describe('PopularNftsService', () => {
  let service: PopularNftsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PopularNftsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
