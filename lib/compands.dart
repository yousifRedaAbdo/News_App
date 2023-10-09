import 'package:flutter/material.dart';
import 'package:training/wep_veiwer.dart';

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
    navigateTo(context, web_view(article['url']),);
  },
  child:Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image:  DecorationImage(

                  fit:BoxFit.cover ,

                  image: NetworkImage(

                    '${article['urlToImage']}',

                  )

              )

          ),

        ),

        const SizedBox(

          width: 20,

        ),

        Expanded(

          child: SizedBox(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:  [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: const TextStyle(

                    color: Colors.grey,

                  ),

                )

              ],

            ),

          ),

        )

      ],

    ),

  ),
);
Widget myDivider() => const Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child:   Divider(
    height: 10,
    thickness: 1,
    color: Colors.grey,
  ),
);

Widget articleBuilder (List,context) => ListView.separated(
    physics:BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(List[index],context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: List.length
) ;

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => widget,
  ),
);

// Widget buildListProduct(model ,context,{bool isOldPrice = true}) => Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Container(
//     width: double.infinity,
//     height: 120,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(
//               image: NetworkImage(model.image.toString()),
//               width: 120,
//               height: 120,
//               fit: BoxFit.cover,
//             ),
//             if (model.discount != 0 && isOldPrice)
//               Container(
//                 height: 12,
//                 color: Colors.red,
//                 padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//                 child: const Text(
//                   'DISCOUNT',
//                   style: const TextStyle(fontSize: 8, color: Colors.white),
//                 ),
//               )
//           ],
//         ),
//         const SizedBox(width: 10,),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 model.name.toString(),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontSize: 13, height: 1.3),
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   Text(
//                     model.price.toString(),
//                     style: const TextStyle(fontSize: 12, color: Colors.blue),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   if (model.discount != 0 && isOldPrice)
//                     Text(
//                       model.oldPrice.toString(),
//                       style: const TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough),
//                     ),
//                   const Spacer(),
//                   IconButton(
//                       padding: EdgeInsets.zero,
//                       onPressed: () {
//                         ShopCubit.get(context).changeFavorites(model.id as int);
//                       },
//                       icon: CircleAvatar(
//                         radius: 20,
//                         backgroundColor: ShopCubit.get(context).favorites[model.id]! ? Colors.redAccent : Colors.white,
//                         child: const Icon(
//                           Icons.favorite_border,
//                           size: 18,
//                         ),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// );