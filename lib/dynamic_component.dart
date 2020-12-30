import 'package:angular/angular.dart';

@Component(
  selector: 'dynamic',
  template: r'''<h1>Hello {{name}}!</h1>''',
)
class DynamicComponent {
  String name = "World";
}
