abstract class NewStates {}

class InitialState extends NewStates{}
class NewBottomNavState extends NewStates{}
class NewGetBuisnessLoadingState extends NewStates{}
class NewsGetBuisnessScssedState extends NewStates{}
class NewsGetBuisnessErorrState extends NewStates
{
  final String error;
  NewsGetBuisnessErorrState(this.error);
}
class NewGetSportsLoadingState extends NewStates{}
class NewsGetSportsScssedState extends NewStates{}
class NewsGetSportsErorrState extends NewStates
{
  final String error;
  NewsGetSportsErorrState(this.error);
}
class NewGetScienceLoadingState extends NewStates{}
class NewsGetScienceScssedState extends NewStates{}
class NewsGetScienceErorrState extends NewStates
{
  final String error;
  NewsGetScienceErorrState(this.error);
}
class NewGetSearchLoadingState extends NewStates{}
class NewsGetSearchScssedState extends NewStates{}
class NewsGetSearchErorrState extends NewStates
{
  final String error;
  NewsGetSearchErorrState(this.error);
}