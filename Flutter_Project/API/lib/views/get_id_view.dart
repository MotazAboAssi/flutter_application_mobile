import 'package:first_project/api/getID.dart';
import 'package:flutter/material.dart';

class GetIdView extends StatefulWidget {
  const GetIdView({super.key});

  @override
  State<GetIdView> createState() => _GetIdViewState();
}

class _GetIdViewState extends State<GetIdView> {
  late Future<Name> futur;

  @override
  void initState() {
    super.initState();
    futur = fetchName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Name>(
              future: futur,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data!.id}. ${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (value) => setState(() {
                  futur = fetchName(id: value);
                }),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
