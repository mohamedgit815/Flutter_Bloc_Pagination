import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pagination_bloc/Core/Service/service_locator.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Screens/post_screen.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Screens/post_pagination_screen.dart';


Future<void> main() async {
  ServiceLocator().init();
  // final BasePostDataSource basePostDataSource = PostDataSource();
  // final BasePostRepository basePostRepository = PostRepository(basePostDataSource);
  // final test = PostsUseCase(basePostRepository);
  // print(await test.basePostRepository.getPosts());

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const HomePage(),
      home: const PostPaginationScreen(),
     //home: const PaginationPostScreen(),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            MaterialButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const PostScreen()));
            },child: const Text("Posts"),) ,


            MaterialButton(onPressed: () {

            },child: const Text("Pagination"),) ,
          ],
        ),
      ),
    );
  }
}

