import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:saltcity_app/core/viewModels/baseModel.dart';
import 'package:saltcity_app/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  BaseView({Key key, this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = sl<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model,
        builder: (context, child) {
          return Consumer<T>(
            builder: widget.builder,
          );
        });
  }
}
