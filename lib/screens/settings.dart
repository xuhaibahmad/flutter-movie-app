import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsSheet {
  final AppTheme theme;

  SettingsSheet(this.theme);

  show(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: buildSheetItems(context),
        ),
      ),
    );
  }

  List<Widget> buildSheetItems(BuildContext context) {
    return [
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Preferences",
              style: theme.bodyText2,
            ),
          ),
          IconButton(
            icon: Icon(
              FlutterIcons.cross_ent,
              color: theme.textColor,
            ),
            iconSize: 24,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      SizedBox(height: 20.0),
      PrefContents(),
    ];
  }
}

class PrefContents extends StatefulWidget {
  const PrefContents({Key key}) : super(key: key);

  @override
  _PrefContentsState createState() => _PrefContentsState(getIt<AppTheme>());
}

class _PrefContentsState extends State<PrefContents> {
  final AppTheme theme;
  AppBloc bloc;

  _PrefContentsState(this.theme);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) => buildPrefs(state),
    );
  }

  Widget buildPrefs(AppState state) {
    return Column(
      children: <Widget>[
        buildSwitch(
          'Night Mode',
          FlutterIcons.moon_ent,
          state.nightModeEnabled,
          (value) => bloc.add(UpdateNightModeEvent(value)),
        ),
        buildSwitch(
          'Content Filter',
          FlutterIcons.filter_faw,
          state.contentFilterEnabled,
          (value) => bloc.add(UpdateContentFilterEvent(value)),
        ),
      ],
    );
  }

  Widget buildSwitch(
    String label,
    IconData icon,
    bool defaultValue,
    Function onChanged,
  ) {
    return SwitchListTile(
      title: Text(label),
      secondary: Icon(
        icon,
        color: theme.textColor,
      ),
      activeColor: theme.pink,
      value: defaultValue,
      onChanged: onChanged,
    );
  }
}
