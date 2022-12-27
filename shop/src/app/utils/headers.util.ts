import {HttpHeaders} from '@angular/common/http';
import {Cookie} from 'ng2-cookies';
import { AuthConstant } from '../constants/auth.constant';

export class HeadersUtil {

  public static getHeaders(): HttpHeaders {
    return new HttpHeaders({
      'Content-Type': 'application/json'
    });
  }

  public static getHeadersAuthOnly(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return new HttpHeaders();
    }
    return new HttpHeaders({
      'Authorization': token
    });
  }

  public static getHeadersUploadOnly(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return new HttpHeaders();
    }
    return new HttpHeaders({
      'Authorization': token,
      'Upload-check': "1"
    });
  }

  public static getHeadersAuth(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return HeadersUtil.getHeaders();
    }

    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': token,
    });
  }
  public static getHeadersAuthMultipart(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return HeadersUtil.getHeaders();
    }

    return new HttpHeaders({
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': token,
    });
  }

  public static getHeadersAuthFile(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return HeadersUtil.getHeaders();
    }

    return new HttpHeaders({
      'Content-Type': 'application/pdf',
      'Authorization': token
    });
  }

  public static getHeadersAuthWithUsername(): HttpHeaders {
    const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
    if (!token) {
      return HeadersUtil.getHeaders();
    }
    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': token,
      // 'X-UNAME': Cookie.get('username')
    });
  }

  public static getHeadersAuthSendingFile(): HttpHeaders {
      const token = AuthConstant.TOKEN_TYPE_KEY + Cookie.get(AuthConstant.ACCESS_TOKEN_KEY);
      if (!token) {
        return HeadersUtil.getHeaders();
      }
      return new HttpHeaders({
        // 'Content-Type': 'multipart/form-data',
        'Authorization': token
      });
  }


}
