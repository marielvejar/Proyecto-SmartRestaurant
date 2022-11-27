import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse,
  HttpClient
} from '@angular/common/http';
import { catchError, Observable, switchMap, throwError } from 'rxjs';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  static accessToken = '';


  constructor(private http: HttpClient) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {

    const req = request.clone({
      setHeaders: {
        Authorization: `Bearer ${AuthInterceptor.accessToken}`
      }
    });


    return next.handle(req).pipe(catchError((err: HttpErrorResponse) =>{
      if(err.status ===401) {
        return this.http.post('http://localhost:3000/refresh', {}, {withCredentials: true})
          .pipe(switchMap (( res: any) => {
            AuthInterceptor.accessToken = res.token;

            return next.handle(request.clone( {
              setHeaders: {
                Authorization: `Bearer ${AuthInterceptor.accessToken}`

              }
            }))
          }));
      }

      return throwError( () => err);
    }));
  }
}
