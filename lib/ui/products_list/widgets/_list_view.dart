part of '../products_list_screen.dart';

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:  EdgeInsets.only(
        top: 12.0.h,
        left: 12.0.w,
        right: 12.0.w,
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: PersonListTile(productsList[index]),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleProductScreen(productsList[index])));
          },
        );
      },
      separatorBuilder: (context, _) =>  SizedBox(height: 11.0.h),
    );
  }
}
