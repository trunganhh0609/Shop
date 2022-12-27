import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { RequestParam } from '../models/request-param';
import { ApiUrlUtil } from '../utils/api-url.util';
import { HeadersUtil } from '../utils/headers.util';
import { ParamUtil } from '../utils/param-util';

@Injectable({
  providedIn: 'root'
})
export class NavbarService {
    numberItemInCart = new BehaviorSubject<number>(0);
    currentNumber = this.numberItemInCart.asObservable();
  constructor(
    private http: HttpClient
  ) { }

  changeNumberInCart(data: number) {
    this.numberItemInCart.next(data);
  }

  getAllCategory():Observable<any> {
    const param = {keySearch: ''}
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/searchCategory', params);
    return this.http.get<any>(url, { headers: header });
  }
}
