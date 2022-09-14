import 'package:final_project_movies_app/provider/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context,moviesProvider,child) {
        return ListView.builder(
          itemCount: moviesProvider.reviews.length,
          itemBuilder: (context, index) => moviesProvider.reviews.length==0?
              Center(child: Text('No Reviews',style: TextStyle(color: Colors.white,),),):
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/avatar.svg',
                      height: 50,
                      width: 50,
                      // fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          moviesProvider.reviews[index].author,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 240,
                          child: Text(moviesProvider.reviews[index].comment,
                            maxLines: 4,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star,color: Colors.orange,),

                        Text(
                          moviesProvider.reviews[index].rating.toString(),
                          style: const TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider( thickness: 1, color: Colors.blue),

              ],
            ),
          ),
        );
      }
    );
  }
}
