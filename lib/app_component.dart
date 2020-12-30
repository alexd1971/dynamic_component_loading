import 'dart:html';

import 'package:angular/angular.dart';

import 'dynamic_component.dart';
import 'dynamic_component.template.dart' as ng;

@Component(
  selector: 'my-app',
  template: '<div #app></div><button (click)="setName()">Click Me</button>',
  directives: [DynamicComponent],
)
class AppComponent implements AfterViewInit {
  final ComponentLoader _loader;
  final Injector _injector;

  AppComponent(this._loader, this._injector) {
    _dynamicComponent = _loader.loadDetached(ng.DynamicComponentNgFactory, injector: _injector);
  }

  @ViewChild('app')
  DivElement app;

  ComponentRef<DynamicComponent> _dynamicComponent;

  @override
  void ngAfterViewInit() {
    app.append(_dynamicComponent.location);
  }

  void setName() {
    _dynamicComponent.update((c) {
        c.name = 'World';
    });
  }
}
