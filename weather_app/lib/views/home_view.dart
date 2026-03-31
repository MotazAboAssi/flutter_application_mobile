import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/actions/determine_color_app_bar.dart';
import 'package:project/actions/move_to.dart';
import 'package:project/bloc/weather_bloc.dart';
import 'package:project/bloc/weather_state.dart';
import 'package:project/models/found_search.dart';
import 'package:project/models/not_found_search.dart';
import 'package:project/theme/theme.dart';
import 'package:project/types/weather_type.dart';
import 'package:project/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.select<WeatherBloc, Color>((bloc) {
            final state = bloc.state;
            return state is WeatherSuccess
                ? determineColorAppBar(state.weatherType)
                : determineColorAppBar(null);
          }),

          title: Text("الطقس", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              iconSize: 30,
              onPressed: () {
                final state = context.read<WeatherBloc>().state;
                return moveTo(
                  context,
                  SearchView(
                    color: state is WeatherSuccess
                        ? determineColorAppBar(state.weatherType)
                        : determineColorAppBar(null),
                  ),
                );
              },
              icon: Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: BlocBuilder<WeatherBloc, StreamOfState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          builder: (BuildContext context, StreamOfState state) {
            final WeatherType? weather = state is WeatherSuccess
                ? state.weatherType
                : null;
            return Container(
              decoration: BoxDecoration(
                gradient: weather == null
                    ? colorByCode(0)
                    : colorByCode(weather.codeImage),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: weather == null
                      ? NotFoundSearch()
                      : FoundSearch(data: weather),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
