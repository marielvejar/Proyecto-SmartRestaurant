import { Pipe, PipeTransform } from '@angular/core';
import {ApiserviceService} from '../apiservice.service'
import { map } from 'rxjs/operators';

@Pipe({
  name: 'getImage'
})
export class GetImagePipe implements PipeTransform {

  constructor( private service: ApiserviceService){}



  transform(value: string){
    //this.service.getImage(value).pipe( map (ressData => {
      //const userAdditionalData = ressData.map(e=> {
        //return {
          //id: e.payload.doc.id,
          //...e.payload.doc.data()
        //7}
      //})
      //console.log(userAdditionalData[0].userImg);
      //return userAdditionalData[0].userImg;
    //}))
  }
}
