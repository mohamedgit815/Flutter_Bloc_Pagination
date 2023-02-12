import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/Core/Service/service_locator.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_bloc.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_event.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Widgets/get_post_widgets.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ServiceLocator.sl<PostsBloc>()
        ..add(GetPostEvent());
      },

      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return Column(
              children: [
                Expanded(child: getPostsWidget())
              ],
            );
          }
        ),
      ),
    );
  }
}
