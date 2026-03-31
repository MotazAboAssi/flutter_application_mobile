
// 5.
//    Scaffold(
//   bottomNavigationBar: ConvexAppBar.builder(
//     count: 5,
//     backgroundColor: Colors.blue,
//     itemBuilder: Builder(),
//   )
// );
// 4.
// Scaffold(
//   bottomNavigationBar: StyleProvider(
//     style: Style(),
//     child: ConvexAppBar(
//       initialActiveIndex: 1,
//       height: 51,
//       top: -30,
//       curveSize: 100,
//       style: TabStyle.fixedCircle,
//       items: [
//         TabItem(icon: Icons.link),
//         TabItem(icon: Icons.import_contacts),
//         TabItem(title: "2020", icon: Icons.work),
//       ],
//       backgroundColor: Colors.blue,
//     ),
//   ),
// );
// 3.
// Scaffold(
//   appBar: AppBar(title: const Text('ConvexButton Example')),
//   body: Center(child: Text('count $count')),
//   bottomNavigationBar: ConvexButton.fab(
//     onTap: () => setState(() => count++),
//   ),
// );
// 2.
//  Scaffold(
//   bottomNavigationBar: ConvexAppBar.badge(

//     {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
//     items: [
//       TabItem(icon: Icons.home, title: 'Home'),
//       TabItem(icon: Icons.map, title: 'Discovery'),
//       TabItem(icon: Icons.add, title: 'Add'),
//     ],
//     onTap: (int i) => print('click index=$i'),
//   ),
// );
// 1.
//  ConvexAppBar(
//   items: [
//     TabItem(icon: Icons.home, title: 'Home'),
//     TabItem(icon: Icons.map, title: 'Discovery'),
//     TabItem(icon: Icons.add, title: 'Add'),
//     TabItem(icon: Icons.message, title: 'Message'),
//     TabItem(icon: Icons.people, title: 'Profile'),
//   ],
//   onTap: (int i) => print('click index=$i'),
// ),

// class Style extends StyleHook {
//   @override
//   double get activeIconSize => 40;

//   @override
//   double get activeIconMargin => 10;

//   @override
//   double get iconSize => 20;

//   @override
//   TextStyle textStyle(Color color, String? str) {
//     return TextStyle(fontSize: 20, color: color);
//   }
// }

// // user defined class
// class Builder extends DelegateBuilder {
//   @override
//   Widget build(BuildContext context, int index, bool active) {
//     return Text('TAB $index');
//   }
// }
