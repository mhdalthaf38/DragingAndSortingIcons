
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, }) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List must be mutable
  List icons = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];

  void _update(int oldIndex, int newIndex) {
    setState(() {
    
 if (newIndex > oldIndex) {
        newIndex -= 1; // Prevent index overflow when moving forward
      }
      // Delay the list modification to avoid the error
     
         var item = icons[oldIndex];
      icons.removeAt(oldIndex);
      icons.insert(newIndex, item);

  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromARGB(255, 44, 42, 42),),
         
          width: 330,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 75,
            
            ),
            child: ReorderableListView(
            padding: EdgeInsets.all(5),
                  
              buildDefaultDragHandles: false,
                       
              scrollDirection: Axis.horizontal,
              
              children: [
                for (final item in icons)
                  ReorderableDragStartListener(
                                   
                    index: icons.indexOf(item),
                    key: ValueKey(item),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                       
                                       
                        height: 48,
                        width: 48,
                        key: ValueKey(item),
                                    
                                       
                        decoration: BoxDecoration(
                                      
                      
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.primaries[item.hashCode % Colors.primaries.length],
                        ),
                        child: Center(child: Icon(item, color: Colors.white)),
                      ),
                    ),
                  ),
                  
              ],
              onReorder: _update,
            ),
          ),
        ),
      ),
    );
  }
}
