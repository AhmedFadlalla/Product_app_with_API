abstract class newsStates{}
class newsInitialState extends newsStates{}
class newsBottomNav extends newsStates{}
class newschangeIndex extends newsStates{}

class newsGetBusinessLodingState extends newsStates{}

class newsGetBusinessSuccessState extends newsStates{}
class newsGetBusinessErrorState extends newsStates{
  final String error;

  newsGetBusinessErrorState(this.error);

}
class newsGetSportsLodingState extends newsStates{}

class newsGetSportsSuccessState extends newsStates{}
class newsGetSportsErrorState extends newsStates{
  final String error;

  newsGetSportsErrorState(this.error);

}

class newsGetScienceLodingState extends newsStates{}

class newsGetScienceSuccessState extends newsStates{}
class newsGetScienceErrorState extends newsStates{
  final String error;

  newsGetScienceErrorState(this.error);

}

class newsGetSearchLodingState extends newsStates{}

class newsGetSearchSuccessState extends newsStates{}
class newsGetSearchErrorState extends newsStates{
  final String error;

  newsGetSearchErrorState(this.error);

}