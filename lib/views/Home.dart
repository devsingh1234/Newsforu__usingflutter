import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/helper/data.dart';
import 'package:myapp/helper/news.dart';
import 'package:myapp/models/Categoryr_model.dart';
import 'package:myapp/models/article_model.dart';
import 'package:myapp/views/article.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> catogories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
 bool _loading =true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catogories=getCategories();
    getnews();
  }

  getnews() async{
    news newssClass = news();
    await newssClass.getNews();
    articles = newssClass.newss;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("News"),
              Text("for(u)",style: TextStyle(
                  color: Colors.red[500]
              ),)
            ],
          ),
          elevation: 0.0,
        ),
        body:_loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
          child:Column(
          children:<Widget> [

            ///catogories
            Container(

              height: 70,
          child: ListView.builder(
          itemCount: catogories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return CategoryTile(ImageUrl: catogories[index].ImageUrl,CategoryName: catogories[index].CategoryName);

          }),
    )
            /// BLOGGG
            ,Container(
              padding: EdgeInsets.only(top: 20),
              child:ListView.builder(
                shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder:(context, index){
                    return BlogTile(
                      imgUrl: articles[index].urltoImage,
                      title: articles[index].title
                      ,discription: articles[index].discr,
                      url: articles[index].url,

                    );
                  }),
            )
      ],
    ),
    ),
        ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String ImageUrl,CategoryName;

  CategoryTile({this.ImageUrl, this.CategoryName,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: ()
    {
      
    },
      child: Container(
        margin: EdgeInsets.only(right: 17),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),

                child: CachedNetworkImage(
                  imageUrl: ImageUrl,width: 120, height: 80, fit: BoxFit.cover,))
            ,Container(
              alignment: Alignment.center,
              width: 120, height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black26,
              ),

              child:Text(CategoryName, style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600), ) ,
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl,title,discription,url;
  BlogTile({@required this.imgUrl, @required this.discription,@required  this.title  ,@required this.url} );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => article(
            BlogUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imgUrl)),
            Text(title , style: TextStyle(
              fontSize: 17,
              color: Colors.black
            ),),
            SizedBox(height: 8,),
            Text(discription ,style: TextStyle(
              fontSize: 11,
              color: Colors.grey
            ),)
          ],
        ),
      ),
    );
  }
}
