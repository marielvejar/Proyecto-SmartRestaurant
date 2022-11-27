import { menuCService } from './../service/menuC.service';
import { menuBService } from './../service/menuB.service';
import { menuAService } from './../service/menuA.service';
import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  constructor(private menuAservice:menuAService, private menuBservice:menuBService, private menuCservice:menuCService) { }

  readprodA: any;
  readprodB: any;
  readprodC: any;


  ngOnInit(): void {
      this.menuAservice.getAllData().subscribe((res)=>{
        console.log(res,"res==>");
        this.readprodA = res.data;
        });
        this.menuBservice.getAllData().subscribe((res)=>{
          console.log(res,"res==>");
          this.readprodB = res.data;  
        });
        this.menuCservice.getAllData().subscribe((res)=>{
          console.log(res,"res==>");
          this.readprodC = res.data; 
        }); 
  }


}