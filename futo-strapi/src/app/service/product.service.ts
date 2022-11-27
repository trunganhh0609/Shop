import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { RequestParam } from '../models/request-param';
import { ApiUrlUtil } from '../utils/api-url.util';
import { HeadersUtil } from '../utils/headers.util';
import { ParamUtil } from '../utils/param-util';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(
    private http: HttpClient,
  ) { }

  getProductDetail(param:any): Observable<any> {
    // const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.publicURL + '/productDetail',params);
    return this.http.get<any>(url);
  }
  getRelatedProduct(param:any): Observable<any> {
    // const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.publicURL + '/relatedProduct',params);
    return this.http.get<any>(url);
  }

  addToCart(param:any): Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/addToCart');
    return this.http.post<any>(url, param, { headers: headers });
  }

  getShoppingCart(param: any):Observable<any>{
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/shoppingCart', params);
    return this.http.get<any>(url, { headers: headers });
  }

  changeQuantityInCart(param:any): Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/changeQuantityInCart');
    return this.http.post<any>(url, param, { headers: headers });
  }
  deleteProductInCart(param: any): Observable<any>{
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/deleteProductInCart');
    return this.http.post<any>(url, param, { headers: headers });
  }
  saveOrder(param:any): Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/saveOrder');
    return this.http.post<any>(url, param, { headers: headers });
  }

  getProductByCategory(param:any):Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/getProductByCategory', params);
    return this.http.get<any>(url, { headers: headers });
  }
}
