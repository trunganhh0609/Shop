import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HeadersUtil } from 'src/app/utils copy/headers.util';
import { ApiUrlUtil } from 'src/app/utils/api-url.util';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class OrderMngService {

  constructor(
    private http: HttpClient
  ) { }

  getAllOrder():Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/getAllOrder');
    return this.http.get<any>(url, { headers: header });
  }
}
