import { Injectable } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiserviceService } from '../apiservice.service';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class UserService {

    constructor(private _http:HttpClient, private service: ApiserviceService) { }
 
    apiUrluser = 'http://localhost:8000/user/';

    
  getAllData():Observable<any>
  {
        return this._http.get(`${this.apiUrluser}`);
  }

   //agregar datos
   addData(data:any):Observable<any>
   {
     console.log(data, 'createdapi=>');
     return this._http.post(`${this.apiUrluser}`, data);
   }
 
   //borrar datos
   deleteData(id:any):Observable<any>
   {
     let ids = id;
     return this._http.delete(`${this.apiUrluser}/${ids}`)
   }
 
   //actualizar datos
   updateData(data:any,id:any):Observable<any>
   {
       let ids = id;
       return this._http.put(`${this.apiUrluser}${ids}`,data);
   }
 
   //conseguir un solo dato
   getSingleData(id:any):Observable<any>
   {
     let ids = id;
     return this._http.get(`${this.apiUrluser} ${ids}`);
   }
 

}
