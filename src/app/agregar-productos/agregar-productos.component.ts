import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {ApiserviceService} from '../apiservice.service';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-agregar-productos',
  templateUrl: './agregar-productos.component.html',
  styleUrls: ['./agregar-productos.component.scss']
})
export class AgregarProductosComponent implements OnInit {

  constructor(private service: ApiserviceService, private router:ActivatedRoute) { }

  errormsg: any;
  successmsg: any;
  getparamid: any;

  ngOnInit(): void {
    console.log(this.router.snapshot.paramMap.get('id'),'getid');
    this.getparamid = this.router.snapshot.paramMap.get('id');
    this.service.getSingleData(this.getparamid).subscribe((res)=>{
          console.log(res,'res==>');
          this.prodForm.patchValue({
            nombre: res.data[0].nombre,
            valor: res.data[0].valor,
            descripcion: res.data[0].descripcion,
            stock: res.data[0].stock,
            categoria: res.data[0].categoria
          })

    });
  }


  prodForm = new FormGroup({
    'nombre': new FormControl('',Validators.required),
    'valor' : new FormControl('', Validators.required),
    'descripcion' : new FormControl('', Validators.required),
    'stock' : new FormControl('', Validators.required),
    'categoria' : new FormControl('', Validators.required)
  });


  //crear nuevo producto
  prodSubmit()
  {
      if(this.prodForm.valid)
      {
        console.log(this.prodForm.value);
        this.service.addData(this.prodForm.value).subscribe((res)=>{
              console.log(res, 'res==>');
              this.prodForm.reset();
              this.successmsg = res.message;
        });
      }
      else{
        this.errormsg = 'Todos los campos son requeridos!';
      }

  }


  //actualizar producto
  prodUpdate()
  {
      console.log(this.prodForm.value,'updatedform');

      if(this.prodForm.valid)
      {

        this.service.updateData(this.prodForm.value, this.getparamid).subscribe((res)=>{
              console.log(res, 'resupdated');
              this.successmsg = res.message;
        });
      }else
      {
          this.errormsg = 'Todos los campos son requeridos';
      }
  }
}
