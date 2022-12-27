import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ApiUrlUtil } from '../utils/api-url.util';
import { HeadersUtil } from '../utils/headers.util';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private http: HttpClient,
  ) { }

  register(param: any): Observable<any>{
    const headers: HttpHeaders = HeadersUtil.getHeadersAuth();
    const url = ApiUrlUtil.buildQueryString(environment.publicURL + '/register');
    return this.http.post<any>(url, param, { headers: headers });
  }
}
