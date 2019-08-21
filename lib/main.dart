
import 'package:balta_bloc_providers/shared/widgets/category/category-list.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shopping/blocs/cart.bloc.dart';
import 'package:balta_bloc_providers/blocs/home.bloc.dart';
//import 'package:shopping/blocs/theme.bloc.dart';
//import 'package:shopping/blocs/user.bloc.dart';
//import 'package:shopping/ui/android/pages/tabs.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      //theme: bloc.theme,
      // home: TabsPage(),
      home: DefaultTabController(
        length: 3,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: 60,
            ),
            CategoryList(
              categories: bloc.categories
            )
          ],
        ),
      ),
    );
  }
}
