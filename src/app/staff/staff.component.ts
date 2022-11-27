import { Component, OnInit } from '@angular/core';
import { MeseroService } from '../service/mesero.service';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-staff',
  templateUrl: './staff.component.html',
  styleUrls: ['./staff.component.scss']
})
export class StaffComponent implements OnInit {

  constructor( private meseroService: MeseroService) { }

  readData: any;

  ngOnInit(): void {
    this.meseroService.getAllData().subscribe((res)=>{
      console.log(res,"res==>");

      this.readData = res.data;
    });
  }


}
