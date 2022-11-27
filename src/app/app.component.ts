import { ApiserviceService } from './apiservice.service';
import { Component } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'portafolioProyect';
  name = 'Test display image';
  thumbnail: any;
  constructor(private config: ApiserviceService, private sanitizer: DomSanitizer) { }

  ngOnInit() {
     this.config.getAllData()
      .subscribe((baseImage : any) => {
        //alert(JSON.stringify(data.image));
        let objectURL = 'data:image/jpeg;base64,' + baseImage.image;

         this.thumbnail = this.sanitizer.bypassSecurityTrustUrl(objectURL);

      });
    //console.log(this.setting.snippet)

  }


}
