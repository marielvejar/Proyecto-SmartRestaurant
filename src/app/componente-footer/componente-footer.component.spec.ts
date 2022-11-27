import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponenteFooterComponent } from './componente-footer.component';

describe('ComponenteFooterComponent', () => {
  let component: ComponenteFooterComponent;
  let fixture: ComponentFixture<ComponenteFooterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ComponenteFooterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ComponenteFooterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
