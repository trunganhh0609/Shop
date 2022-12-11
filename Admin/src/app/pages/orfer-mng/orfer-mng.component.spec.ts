import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OrferMngComponent } from './orfer-mng.component';

describe('OrferMngComponent', () => {
  let component: OrferMngComponent;
  let fixture: ComponentFixture<OrferMngComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OrferMngComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OrferMngComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
