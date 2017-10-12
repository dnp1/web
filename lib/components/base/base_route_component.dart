import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/services/title_service.dart';


abstract class BaseRouteComponent implements OnActivate {
  final TitleService _titleService;
  final RouteData _data;

  BaseRouteComponent(this._titleService, this._data);


  String getTitle() => _data.get('title');

  @override
  routerOnActivate(ComponentInstruction _next, ComponentInstruction _prev) =>
      _titleService.setTitle(getTitle());

}




