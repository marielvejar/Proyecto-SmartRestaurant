import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-componente-nav-bar',
  templateUrl: './componente-nav-bar.component.html',
  styleUrls: ['./componente-nav-bar.component.scss']
})
export class ComponenteNavBarComponent implements OnInit {
  message = '';

  constructor(private http: HttpClient ) {}

  ngOnInit(): void {
    this.http.get('http://localhost:3000/user')
      .subscribe( (res) =>{
        this.message = 'Bienvenido ${res.name}';
      });
    
    
  }

  
}
