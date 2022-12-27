import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RequestParam } from 'src/app/models/request-param';
import { HeadersUtil } from 'src/app/utils copy/headers.util';
import { ApiUrlUtil } from 'src/app/utils/api-url.util';
import { ParamUtil } from 'src/app/utils/param.util';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(
    private http: HttpClient
  ) { }

  searchCategory(param:any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/searchCategory', params);
    return this.http.get<any>(url, { headers: header });
  }

  save(param:any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/saveCategory');
    return this.http.post<any>(url, param, { headers: header });
  }
  delete(param:any):Observable<any> {
    const header: HttpHeaders = HeadersUtil.getHeadersAuth();
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/deleteCategory');
    return this.http.post<any>(url, param, { headers: header });
  }
}
