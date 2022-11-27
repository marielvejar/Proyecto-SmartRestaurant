import { CommentsModule } from './comments/comments.module';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AgregarProductosComponent } from '../app/agregar-productos/agregar-productos.component';
import { ProductosComponent } from './productos/productos.component';
import { ApiserviceService } from './apiservice.service';
import { HttpClientModule, HTTP_INTERCEPTORS } from'@angular/common/http';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from '../app/signup/signup.component';
import { ComandaComponent } from '../app/comanda/comanda.component';
import { ComponenteNavBarComponent } from '../app/componente-nav-bar/componente-nav-bar.component';
import { ComponenteFooterComponent } from '../app/componente-footer/componente-footer.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { MesasComponent } from './mesas/mesas.component';
import { GetImagePipe } from './productos/get-image.pipe';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomeComponent } from './home/home.component';
import { RouterModule } from '@angular/router';
import { CartComponent } from './cart/cart.component';
import { MenuComponent } from './menu/menu.component';
import { StaffComponent } from './staff/staff.component';
import { AuthInterceptor } from './interceptors/auth.interceptor';






@NgModule({
  declarations: [
    AppComponent,
    AgregarProductosComponent,
    ProductosComponent,
    LoginComponent,
    SignupComponent,
    ComandaComponent,
    ComponenteNavBarComponent,
    ComponenteFooterComponent,
    AboutusComponent,
    GetImagePipe,
    ComponenteNavBarComponent,
    ComponenteFooterComponent,
    HomeComponent,
    CartComponent,
    MenuComponent,
    MesasComponent,
    StaffComponent,
    MenuComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    CommentsModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    BrowserAnimationsModule,
    RouterModule,
  ],

  providers: [[ApiserviceService],
  { 
    provide: HTTP_INTERCEPTORS,
    useClass : AuthInterceptor,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
