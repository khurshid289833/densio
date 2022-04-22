import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';

class WarrantyView extends StatefulWidget {
  const WarrantyView({Key? key}) : super(key: key);

  @override
  _WarrantyViewState createState() => _WarrantyViewState();
}

class _WarrantyViewState extends State<WarrantyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(top: 20),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DDM-P-01",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                      Image.asset("assets/images/cross.png"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/images/device.png",height: 18,width: 25),
                      SizedBox(width: 8),
                      Text(AppString.warrantyDetails,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20,left: 40,right: 30),
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Text("${AppString.dateOfPurchase} 30/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20,left: 40,right: 30),
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Text("${AppString.warrantyExpiry} 30/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 39,
                    width: 150,
                    margin: EdgeInsets.only(top: 20,left: 40,right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.blueColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(AppString.extendWarranty,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                      ),
                      onPressed: ()async{},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                height: 39,
                width: 190,
                margin: EdgeInsets.only(right: 20,bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:  BorderSide(color: AppColor.blueColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.call_outlined,color: AppColor.blueColor,size: 20),
                      SizedBox(width: 5),
                      Text(AppString.customerSupport,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                      ),
                    ],
                  ),
                  onPressed: (){},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
