import { Component, OnInit } from '@angular/core';
import { ApiserviceService} from '../apiservice.service';
import { CartService } from '../service/cart.service';
import { DomSanitizer } from '@angular/platform-browser';
import { ComandaserviceService } from '../service/comandaservice.service';
import { ActivatedRoute } from '@angular/router';
import { FormControl, FormGroup } from '@angular/forms';
@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.scss']
})
export class ProductosComponent implements OnInit {

  constructor(private comandaService: ComandaserviceService, private router:ActivatedRoute, private sanitizer: DomSanitizer, private service: ApiserviceService, private cartService : CartService) { }

  readData: any;
  successmsg:any;
  getparamid: any;

  ngOnInit(): void {
      this.service.getAllData().subscribe((res)=>{
        console.log(res,"res==>");
        ///NO LO BORRRES JESUSCRISTO
        this.readData = res.data;
      // POR FAVOR NO LO BORRES
        });
        this.readData.forEach((a:any)=>{
          Object.assign(a,{cantidad:1,total:a.precio});
        });
        this.getparamid = this.router.snapshot.paramMap.get('id');
        this.comandaService.getSingleData(this.getparamid).subscribe((res)=>{
          console.log(res, 'res==>');
          this.comandaForm.patchValue({
              comandaid : res.data[0].comandaid,
          })
        });
  }

  comandaForm = new FormGroup({
    'comandaid': new FormControl()
  });
  addtocomanda(item: any){
      this.cartService.addtoCart(item);
      this.cartService.setProducto(item)
  }


}
