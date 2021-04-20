import 'package:myapp/models/Categoryr_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.CategoryName = "Bussiness";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Entertainmnet";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1560169897-fc0cdbdfa4d5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Genral";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Health";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1434494878577-86c23bcb06b9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Sports";
  categoryModel.ImageUrl="https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;

}