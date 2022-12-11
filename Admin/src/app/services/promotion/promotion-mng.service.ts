import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HeadersUtil } from 'src/app/utils copy/headers.util';
import { ApiUrlUtil } from 'src/app/utils/api-url.util';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PromotionMngService {

  constructor(
    private http: HttpClient,
  ) { }

  getAll():Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/getAllPromotion');
    return this.http.get<any>(url, { headers: header });
  }
  save(param:any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/savePromotion');
    return this.http.post<any>(url, param, { headers: header });
  }

  delete(item:any): Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/deletePromotion');
    return this.http.post<any>(url, item, { headers: header });
  }
}
