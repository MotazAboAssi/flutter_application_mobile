import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/actions/back_to.dart';
import 'package:project/bloc/weather_bloc.dart';
import 'package:project/bloc/weather_event.dart';
import 'package:project/bloc/weather_state.dart';
import 'package:project/views/search_view.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.widget,
  });

  final TextEditingController controller;
  final SearchView widget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.color),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        labelText: "ابحث",
        floatingLabelStyle: TextStyle(color: widget.color),

        hintText: "ادخل المدينة المطلوبة",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: BlocConsumer<WeatherBloc, StreamOfState>(
          builder: (contextBloc, state) {
            if (state is Weatherloading) {
              return SizedBox(
                height: 75,
                width: 75,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return IconButton(
              onPressed: () {
                final city = controller.text.trim();
                if (city.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("يرجى إدخال اسم المدينة")),
                  );
                  return;
                }
                context.read<WeatherBloc>().add(ChangeWeatherEvent(city: city));
              },
              icon: Icon(Icons.search),
            );
          },
          listener: (BuildContext context, Object? state) async {
            if (state is WeatherSuccess) {
              backTo(context);
            }
            if (state is WeatherFailed) {
              return await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      " 🔴 Error",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
