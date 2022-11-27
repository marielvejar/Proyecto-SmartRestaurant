import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../service/user.service';
import {first} from 'rxjs/operators';
import { AuthInterceptor } from '../interceptors/auth.interceptor';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  form!: FormGroup;
  constructor(private formBuilder: FormBuilder, private http : HttpClient,
    private router : Router, private userService : UserService) { }

  ngOnInit(): void {

    this.form = this.formBuilder.group({
      username: [],
      password:[]
    });
    }

    Submit(){
      this.http.post('http://localhost:3000/user', this.form.getRawValue(), {withCredentials: true})
        .subscribe( (res:any) =>{
          AuthInterceptor.accessToken = res.token;

          this.router.navigate(['/']);
        });
      }
}