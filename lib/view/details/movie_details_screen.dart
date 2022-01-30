import 'package:flutter/material.dart';
import 'package:project/models/moviesList/movies_main.dart';
import 'package:project/res/app_context_extension.dart';
import 'package:project/utils/utils.dart';
import 'package:project/view/widget/my_chips.dart';
import 'package:project/view/widget/my_text_view.dart';

class MovieDetailsScreen extends StatelessWidget {
  // receive data from the HomeScreen as a parameter
  const MovieDetailsScreen(this.movieData, {Key? key}) : super(key: key);

  static const String id = "movie_details";

  final Movie? movieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.movieDetailScreen)),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    movieData?.posterurl ?? "",
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/img_error.png');
                    },
                    fit: BoxFit.fill,
                    height: context.resources.dimension.imageHeight,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                          title: MyTextView(
                            movieData?.title ?? "NA",
                            context.resources.color.colorPrimaryText,
                            context.resources.dimension.bigText,
                          ),
                          subtitle: MyTextView(
                            movieData?.year ?? "NA",
                            context.resources.color.colorSecondaryText,
                            context.resources.dimension.mediumText,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyTextView(
                                  "${Utils.setAverageRating(movieData?.ratings ?? [])}",
                                  context.resources.color.colorBlack,
                                  context.resources.dimension.mediumText),
                              SizedBox(
                                width:
                                    context.resources.dimension.verySmallMargin,
                              ),
                              Icon(
                                Icons.star,
                                color: context.resources.color.colorAccent,
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Container(
                          child: MyTextView(
                            context.resources.strings.titleCategories,
                            context.resources.color.colorPrimaryText,
                            context.resources.dimension.bigText,
                          ),
                          alignment: AlignmentDirectional.topStart,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.genres,
                            context.resources.color.catChipColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Container(
                          child: MyTextView(
                              context.resources.strings.titleCast,
                              context.resources.color.colorPrimaryText,
                              context.resources.dimension.bigText),
                          alignment: AlignmentDirectional.topStart,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.actors,
                            context.resources.color.castChipColor),
                      ),
                    ],
                  ),
                  elevation: context.resources.dimension.highElevation,
                  margin:
                      EdgeInsets.all(context.resources.dimension.smallMargin),
                  color: context.resources.color.colorWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setChipView(List<String>? data, Color color) {
    var size = data?.length ?? 0;
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        children: [
          for (int i = 0; i < size; i++) MyChips(data?[i] ?? "NA", color)
        ],
      ),
    );
  }
}
