import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    //return _ProductScreenBody(productService: productService);
    return ChangeNotifierProvider(
        create: (_) => ProductFormProvider(productService.selectedProduct),
        child: _ProductScreenBody(productService: productService));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productform = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
        Stack(
          children: [
            ProductImg(
              url: productService.selectedProduct.picture,
            ),
            Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                top: 60,
                right: 30,
                child: IconButton(
                  onPressed: () async {
                    final _picker = new ImagePicker();
                    final XFile? pickedFile = await _picker.pickImage(
                        source: ImageSource.camera, imageQuality: 100);
                    productService.updateSelectedProductImage(pickedFile!.path);
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        _ProductForm(),
        const SizedBox(height: 100)
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: productService.isSaving
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Icon(Icons.save_outlined),
        onPressed: productService.isSaving
            ? null
            : () async {
                if (!productform.isValidForm()) return;
                final String? imageUrl = await productService.uploadImage();
                if (imageUrl != null) productform.product.picture = imageUrl;
                await productService.saveOrCreateProduct(productform.product);
              },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BuildBoxDecoration(),
        child: Form(
            key: productForm.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El texto es obligatorio';
                  },
                  decoration: InputDecorations.authInpuDecoration(
                      hintText: 'Nombde del producto', labelText: 'Nombre:'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: '${product.price}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product.price = 0;
                    } else {
                      product.price = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInpuDecoration(
                      hintText: '\$99.99', labelText: 'Precio:'),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Disponible'),
                    Switch.adaptive(
                        value: product.available,
                        activeColor: Colors.indigo,
                        onChanged: productForm.updateAvailability)
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            )),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]);
}
