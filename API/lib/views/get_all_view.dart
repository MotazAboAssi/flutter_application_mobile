import 'package:first_project/api/get.dart';
import 'package:flutter/material.dart';

class GetAllView extends StatefulWidget {
  const GetAllView({super.key});

  @override
  State<GetAllView> createState() => _GetAllViewState();
}

class _GetAllViewState extends State<GetAllView> {
  late Future<List<Name>> futur;

  @override
  void initState() {
    super.initState();
    futur = fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Data")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            FutureBuilder(
              future: futur,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final Name e = snapshot.data![index];
                        return Text("${e.id}. ${e.firstName} ${e.lastName}");
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
