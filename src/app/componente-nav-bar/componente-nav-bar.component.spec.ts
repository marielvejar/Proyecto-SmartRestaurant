import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponenteNavBarComponent } from './componente-nav-bar.component';

describe('ComponenteNavBarComponent', () => {
  let component: ComponenteNavBarComponent;
  let fixture: ComponentFixture<ComponenteNavBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ComponenteNavBarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ComponenteNavBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
