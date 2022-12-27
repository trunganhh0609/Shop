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
export class HomePageService {

  constructor(
    private http: HttpClient,
  ) { }

  getDataHome(): Observable<any> {
    // const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    // const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.publicURL + '/homeData');
    return this.http.get<any>(url);
  }
}
