import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';

class SettingsSheet {
  static show(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
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

  static List<Widget> buildSheetItems(BuildContext context) {
    return [
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Preferences",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            icon: Icon(FlutterIcons.cross_ent),
            iconSize: 24,
            color: Colors.black45,
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
  _PrefContentsState createState() => _PrefContentsState();
}

class _PrefContentsState extends State<PrefContents> {
  AppBloc bloc;

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
      secondary: Icon(icon),
      value: defaultValue,
      onChanged: onChanged,
    );
  }
}
