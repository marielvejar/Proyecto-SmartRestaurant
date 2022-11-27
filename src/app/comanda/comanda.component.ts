import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CartService } from '../service/cart.service';
import { ComandaserviceService } from '../service/comandaservice.service';
import { FormGroup, FormControl } from '@angular/forms';

@Component({
  selector: 'app-comanda',
  templateUrl: './comanda.component.html',
  styleUrls: ['./comanda.component.scss']
})
export class ComandaComponent implements OnInit {

  public productos: any = [];
  public grandTotal !: number;
  getparamid: any;


  constructor(private comandaService: ComandaserviceService ,private cartService: CartService, private router:ActivatedRoute) { }

  ngOnInit(): void {
    console.log(this.router.snapshot.paramMap.get('id'),'getid');
    this.getparamid = this.router.snapshot.paramMap.get('id');
    this.comandaService.getSingleData(this.getparamid).subscribe((res)=>{
        console.log(res, 'res==>');
        this.comandaForm.patchValue({
          comandaid : res.data[0].comandaid,
        });
    });
    this.cartService.getProductos()
    .subscribe(res=>{
      this.productos = res;
      this.grandTotal = this.cartService.getTotalPrice();
    });

  }

  comandaForm = new FormGroup({
    'comandaid': new FormControl()
  });


  removeItem(item:any){
    this.cartService.removeCartItem(item);
  }
    emptycart(){
      this.cartService.removeAllCart();
    }
}
