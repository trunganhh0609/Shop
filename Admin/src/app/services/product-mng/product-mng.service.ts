import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HeadersUtil } from 'src/app/utils copy/headers.util';
import { ApiUrlUtil } from 'src/app/utils/api-url.util';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProductMngService {

  constructor(
    private http: HttpClient
  ) { }

  getProductMng():Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/getProductMng');
    return this.http.get<any>(url, { headers: header });
  }

  getDataProductMngForm():Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/getDataProductMngForm');
    return this.http.get<any>(url, { headers: header });
  }

  uploadImage(formData: FormData):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.publicURL + '/uploadImg');
    return this.http.post<any>(url, formData);
  }

  saveProduct(param: any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/addProduct');
    return this.http.post<any>(url, param, { headers: header });
  }
  editProduct(param: any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/editProduct');
    return this.http.post<any>(url, param, { headers: header });
  }

  deleteProduct(param:any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/deleteProduct');
    return this.http.post<any>(url, param, { headers: header });
  }
}
