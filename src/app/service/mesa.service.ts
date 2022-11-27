import { Injectable } from '@angular/core';
import { ApiserviceService } from '../apiservice.service';
import { BehaviorSubject, Observable} from 'rxjs';
import { HttpClient, HttpHeaders} from '@angular/common/http';



@Injectable({
  providedIn: 'root'
})
export class MesaService {

  constructor(private _http:HttpClient, private service: ApiserviceService) { }

  apiUrlmesa = 'http://localhost:8000/mesa/';


  publicMesaList:  any = [];
  public productoList = new BehaviorSubject<any>([]);

  getAllData():Observable<any>
  {
        return this._http.get(`${this.apiUrlmesa}`);
  }


  addMesa(data:any){
    console.log(data, 'createdapi=>');
    return this._http.post(`${this.apiUrlmesa}`, data);

  }

  getProductos(){
    return this.productoList.asObservable();

  }

  //conseguir un solo dato
  getSingleData(id:any):Observable<any>
  {
    let ids = id;
    return this._http.get(`${this.apiUrlmesa} ${ids}`);
  }
  
}
