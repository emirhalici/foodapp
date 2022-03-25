import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/models/meal_model.dart';

String upperCaseFirstLetter(String val) {
  return val[0].toUpperCase() + val.substring(1);
}

class FoodCard extends StatelessWidget {
  MealModel mealModel;
  FoodCard({Key? key, required this.mealModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < mealModel.ingredients.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              upperCaseFirstLetter(mealModel.ingredients[i]),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              upperCaseFirstLetter(mealModel.ingredientMeasures[i]),
            ),
          ],
        ),
      ));
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 16.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Card(
            color: Theme.of(context).brightness == Brightness.dark ? Color(0xAA393f41) : Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {},
              child: Column(
                children: [
                  if (mealModel.image == '')
                    Container()
                  else
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.network(
                            mealModel.image,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                            child: Text(
                              '#' + mealModel.id.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          mealModel.meal,
                          style: TextStyle(fontSize: 24.sp),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Ingredients',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        Column(
                          children: list,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Instructions',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          mealModel.instructions,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
