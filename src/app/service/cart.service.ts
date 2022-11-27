import { Injectable } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import { ApiserviceService } from '../apiservice.service';
@Injectable({
  providedIn: 'root'
})
export class CartService {

  public cartItemList : any = []
  public productoList = new BehaviorSubject<any>([]);
  getparamvalor: any;

  constructor(private service: ApiserviceService, private router:ActivatedRoute) { }
  getProductos(){
    return this.productoList.asObservable();

  }
  setProducto(producto: any){
    this.cartItemList.push(...producto);
    this.productoList.next(producto);
  }

  addtoCart(producto: any) {
    this.cartItemList.push(producto);
    this.productoList.next(this.cartItemList);
    this.getTotalPrice();
    console.log(this.cartItemList);
  }

  getTotalPrice() :number{
    let grandTotal = 0;
    this.cartItemList.map((a:any)=>{
      grandTotal += a.total;

    })
    return grandTotal;
  }


  removeCartItem(producto: any){
    this.cartItemList.map((a:any, index:any)=>{
      if(producto.id === a.id){
        this.cartItemList.splice(index,1);
      }
    });
    this.productoList.next(this.cartItemList);
  }
  removeAllCart(){
    this.cartItemList = []
    this.productoList.next(this.cartItemList);
  }
}
