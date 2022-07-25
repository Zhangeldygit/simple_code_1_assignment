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
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
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
      separatorBuilder: (context, _) => const SizedBox(height: 26.0),
    );
  }
}
