import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: const AnimatedTextStyleExample()));

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedContainer")),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => big = !big),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: big ? 200 : 100,
            height: big ? 200 : 100,
            color: big ? Colors.blue : Colors.red,
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedOpacity")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const FlutterLogo(size: 100),
            ),
            ElevatedButton(
              onPressed: () => setState(() => visible = !visible),
              child: const Text("Toggle"),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool topLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedAlign")),
      body: GestureDetector(
        onTap: () => setState(() => topLeft = !topLeft),
        child: Container(
          color: Colors.grey.shade300,
          child: AnimatedAlign(
            alignment: topLeft ? Alignment.topLeft : Alignment.bottomRight,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: const FlutterLogo(size: 80),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool left = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedPositioned")),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: left ? 20 : 200,
            top: 50,
            child: GestureDetector(
              onTap: () => setState(() => left = !left),
              child: const FlutterLogo(size: 100),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedSwitcher")),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, animation) =>
              SizeTransition(sizeFactor: animation, child: child),
          child: toggle
              ? const FlutterLogo(key: ValueKey(1), size: 100)
              : const Icon(
                  Icons.star,
                  size: 100,
                  color: Colors.amber,
                  key: ValueKey(2),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => toggle = !toggle),
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedCrossFade")),
      body: Center(
        child:
            // ******************
            // child: AnimatedSwitcher(
            //   duration: Duration(milliseconds: 500),
            //   child: first
            //       ? const FlutterLogo(size: 100)
            //       : const Icon(Icons.favorite, size: 100, color: Colors.red),
            //   transitionBuilder: (child, animation) {
            //     return FadeTransition(opacity: animation, child: child);
            //   },
            // ),
            // ******************
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: const FlutterLogo(size: 100),
              secondChild: const Icon(
                Icons.favorite,
                size: 100,
                color: Colors.red,
              ),
              crossFadeState: first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              // ),
              // ******************
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => first = !first),
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}



class AnimatedTextStyleExample extends StatefulWidget {
  const AnimatedTextStyleExample({super.key});

  @override
  State<AnimatedTextStyleExample> createState() => _AnimatedTextStyleExampleState();
}

class _AnimatedTextStyleExampleState extends State<AnimatedTextStyleExample> {
  bool big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedDefaultTextStyle")),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => big = !big),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: TextStyle(
              fontSize: big ? 40 : 20,
              color: big ? Colors.blue : Colors.black,
              fontWeight: big ? FontWeight.bold : FontWeight.normal,
            ),
            child: const Text("Tap me!"),
          ),
        ),
      ),
    );
  }
}
