import { MenuComponent } from './menu/menu.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AgregarProductosComponent } from './agregar-productos/agregar-productos.component';
import { ProductosComponent } from './productos/productos.component';
import { LoginComponent } from './login/login.component';
import { MesasComponent } from './mesas/mesas.component';
import { SignupComponent } from './signup/signup.component';
import { ComandaComponent } from './comanda/comanda.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { HomeComponent } from './home/home.component';
import { StaffComponent } from './staff/staff.component';
import { CommentsComponent } from './comments/comments.component';

const routes: Routes = [
  {path:'', component:HomeComponent},
  {path: 'agregar-productos', component:AgregarProductosComponent},
  {path: 'agregar-productos/:id', component:AgregarProductosComponent},
  {path: 'productos', component:ProductosComponent},
  {path: 'login', component:LoginComponent},
  {path: 'signup', component:SignupComponent},
  {path: 'mesas', component:MesasComponent},
  {path: 'mesas/:id', component:MesasComponent},
  {path: 'comanda', component:ComandaComponent},
  {path: 'comanda/:id', component:ComandaComponent},
  {path: 'aboutus', component:AboutusComponent},
  {path: 'staff', component:StaffComponent},
  {path: 'menu', component:MenuComponent},
  {path: 'comments', component:CommentsComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
