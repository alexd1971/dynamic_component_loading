import 'package:angular/angular.dart';

import 'dynamic_component.dart';
import 'dynamic_component.template.dart' as ng;

@Component(
  selector: 'my-app',
  template: '<template #marker></template>',
  directives: [DynamicComponent],
)
class AppComponent implements AfterViewInit {
  final ComponentLoader _loader;

  AppComponent(this._loader);

  @ViewChild('marker', read: ViewContainerRef)
  ViewContainerRef location;

  ComponentRef _dynamicComponent;

  @override
  void ngAfterViewInit() {
    _dynamicComponent =
        _loader.loadNextToLocation(ng.DynamicComponentNgFactory, location);
  }
}
