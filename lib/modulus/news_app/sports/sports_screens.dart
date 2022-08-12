
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/news_layout/cubit/cubit.dart';
import '../../../layouts/news_layout/cubit/states.dart';
import '../../../shared/component/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<newsCubit,newsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=newsCubit.get(context).sports;
        return state is! newsGetSportsLodingState?
        articleBuilder(list,context):const Center(
          child: CircularProgressIndicator(),
        );

      },
    );
  }
}
