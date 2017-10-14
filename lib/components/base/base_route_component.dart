import 'dart:async';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/services/title_service.dart';


abstract class BaseRouteComponent implements OnActivate {
  final TitleService _titleService;
  final RouteData _data;
  final Router _router;

  BaseRouteComponent(this._titleService, this._data, this._router);


  String getTitle() => _data.get('title');

  Future<bool> allowed() async => true;

  @override
  Future<Null> routerOnActivate(ComponentInstruction _next, ComponentInstruction _prev) async {
    if (!await allowed()) {
      _router.navigate(["Articles"]);
    }
    _titleService.setTitle(getTitle());
  }




}




