import 'package:flutter/material.dart';
import 'package:flutter_project2/api/api.dart';
import 'package:flutter_project2/widgets/trending_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_project2/widgets/movies_slider.dart';
import 'package:flutter_project2/models/movies.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies=Api().getTrendingMovies();
    topRatedMovies=Api().getTopRatedMovies();
    upcomingMovies=Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Image.asset('lib/images/FILMY.jpg',
          fit: BoxFit.cover,
          height: 200,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            const SizedBox(height: 32),
              SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context,snapshot) {
                  if(snapshot.hasError) {
                    return Center(
              child: Text( snapshot.error.toString()),
                    );
                  } else if(snapshot.hasData){
                    return TrendingSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                  },
              ),
            ),


            const SizedBox(height: 32),
            Text(
              'Top Rated Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context,snapshot) {
                  if(snapshot.hasError) {
                    return Center(
                      child: Text( snapshot.error.toString()),
                    );
                  } else if(snapshot.hasData){
                    return MoviesSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),


            const SizedBox(height: 16),
            Text(
              'Upcoming Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: upcomingMovies,
                builder: (context,snapshot) {
                  if(snapshot.hasError) {
                    return Center(
                      child: Text( snapshot.error.toString()),
                    );
                  } else if(snapshot.hasData){
                    return MoviesSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

          ],


        ),


      ),


    );


}
}





