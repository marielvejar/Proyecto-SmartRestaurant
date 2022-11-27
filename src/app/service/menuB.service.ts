import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class menuBService {

  constructor(private _http:HttpClient) { }


  apiUrl = 'http://localhost:8000/productosbebestibles/';



 //conseguir todas las comandas
  getAllData():Observable<any>
  {
        return this._http.get(`${this.apiUrl}`);
  }

  // agregar comanda
  addData(data:any):Observable<any>
  {
    console.log(data, 'createdapi=>');
    return this._http.post(`${this.apiUrl}`, data);

  }

  //actualizar datos
  updateData(data:any,id:any):Observable<any>
  {
      let ids = id;
      return this._http.put(`${this.apiUrl}${ids}`,data);
  }


  //conseguir un solo dato
  getSingleData(id:any):Observable<any>
  {
    let ids = id;
    return this._http.get(`${this.apiUrl} ${ids}`);
  }

}
