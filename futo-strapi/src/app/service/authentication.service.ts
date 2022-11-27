import { DOCUMENT } from '@angular/common';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cookie } from 'ng2-cookies';
import { AuthConstant } from 'src/app/constants/auth.constant';
import { AuthenticationUtil } from 'src/app/utils/authentication.util';
import { environment } from 'src/environments/environment';
import { HeadersUtil } from 'src/app/utils/headers.util';
import { ApiUrlUtil } from 'src/app/utils/api-url.util';
import { Router } from '@angular/router';
import { ParamUtil } from 'src/app/utils/param-util';
import { RequestParam } from '../models/request-param';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(
    private http: HttpClient,
    @Inject(DOCUMENT) public document: any,
  ) {}

  logIn(user:any):Observable<any>{
      return this.http.post<any>(environment.authURL,user);
  }
  getRole(param: any): Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/userRole', params);
    return this.http.get<any>(url, { headers: headers });
  }
  getUserInfo(param: any): Observable<any> {
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const params: RequestParam[] = ParamUtil.toRequestParams(param);
    const url = ApiUrlUtil.buildQueryString(environment.apiURL + '/userInfo', params);
    return this.http.get<any>(url, { headers: headers });
  }

  logout(){
    AuthenticationUtil.deleteAllCookie();
  }
}
