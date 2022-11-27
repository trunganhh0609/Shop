import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NavbarService {
    numberItemInCart = new BehaviorSubject<number>(0);
    currentNumber = this.numberItemInCart.asObservable();
  constructor() { }

  changeNumberInCart(data: number) {
    this.numberItemInCart.next(data);
  }
}
