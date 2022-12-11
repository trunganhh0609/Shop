import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ThienAnConstant } from 'src/app/constants/thien-an.constant';
import { AuthenticationUtil } from 'src/app/utils copy/authentication.util';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CommonService {

  // menuData = new BehaviorSubject<any>({})
  // menuDataFull = new BehaviorSubject<any>({})
  // currentData =this.menuData.asObservable();
  // currentDataFull =this.menuDataFull.asObservable();
  tempData : any = [];
  tempDataFull: any = [];
  constructor(
    private http: HttpClient,
  ) {}

  getClassByTeacherId(param: any):Observable<any>{
    const headers = { 'Authorization': AuthenticationUtil.getToken() };
    const url = "http://daotao.hnue.edu.vn/UniDormAPI//SQLExecute/ExecuteQuerryString";
    return this.http.post<any>(url, param, {headers});
  }
  getStudentInClass(param:any):Observable<any>{
    const headers = { 'Authorization': AuthenticationUtil.getToken() };
    const url = "http://daotao.hnue.edu.vn/UniDormAPI//SQLExecute/ExecuteQuerryString";
    return this.http.post<any>(url, param , {headers});
  }


}

