import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  _SummaryViewState createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  List<String> dropdown = ["Last 7 Days","Last 15 Days","Last 30 Days"];
  String _dropDownValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(top: 20,left: 15,right: 15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("DDM-P-01",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              Image.asset("assets/images/cross.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Image.asset("assets/images/device.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text("${AppString.model} DDM01",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 25,right: 15),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.type} Petrol & Diesel",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Image.asset("assets/images/refresh.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text(AppString.deviceCalibrationDetails,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 25,right: 15),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.lastCalibratedDate} 23/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 25,right: 15),
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.calibrationReport,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                SizedBox(
                  height: 21,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side:  BorderSide(color: AppColor.blueColor),
                      ),
                    ),
                    child: Text(AppString.viewReport,
                      style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                    ),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 25,right: 15),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.nextCalibrationDate} 23/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Image.asset("assets/images/person.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text(AppString.deviceCertification,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 25,right: 15),
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.deviceCertificateISO,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                SizedBox(
                  height: 21,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side:  BorderSide(color: AppColor.blueColor),
                      ),
                    ),
                    child: Text(AppString.viewCertificate,
                      style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                    ),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(AppString.latestResult,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                    Container(
                      height: 26,
                      width: 26,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: AppColor.lightBlueBackground,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Image.asset("assets/images/download.png"),
                    ),
                  ],
                ),
                Container(
                  width: 104,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFFCCCEDD)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: dropdown.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Column(
                              children: [
                                Text(item),
                                Divider(color: Colors.black),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _dropDownValue = value!;
                          });
                        },
                        style: TextStyle(fontSize: 12,color: Colors.black),
                        icon: Image.asset("assets/images/downArrow.png"),
                        hint: Text(AppString.sortBy,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(height: 200),
          // Container(
          //   child: Center(
          //     child: DropdownButtonHideUnderline(
          //       child: DropdownButton2(
          //         isExpanded: true,
          //         hint: Row(
          //           children: const [
          //             Icon(
          //               Icons.list,
          //               size: 16,
          //               color: Colors.yellow,
          //             ),
          //             SizedBox(
          //               width: 4,
          //             ),
          //             Expanded(
          //               child: Text(
          //                 'Select Item',
          //                 style: TextStyle(
          //                   fontSize: 14,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.yellow,
          //                 ),
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ],
          //         ),
          //         items: items
          //             .map((item) =>
          //             DropdownMenuItem<String>(
          //               value: item,
          //               child: Text(
          //                 item,
          //                 style: const TextStyle(
          //                   fontSize: 14,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white,
          //                 ),
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ))
          //             .toList(),
          //         value: selectedValue,
          //         onChanged: (value) {
          //           setState(() {
          //             selectedValue = value as String;
          //           });
          //         },
          //         icon: const Icon(
          //           Icons.arrow_forward_ios_outlined,
          //         ),
          //         iconSize: 14,
          //         iconEnabledColor: Colors.yellow,
          //         iconDisabledColor: Colors.grey,
          //         buttonHeight: 50,
          //         buttonWidth: 160,
          //         buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          //         buttonDecoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(14),
          //           border: Border.all(
          //             color: Colors.black26,
          //           ),
          //           color: Colors.redAccent,
          //         ),
          //         buttonElevation: 2,
          //         itemHeight: 40,
          //         itemPadding: const EdgeInsets.only(left: 14, right: 14),
          //         dropdownMaxHeight: 200,
          //         dropdownWidth: 200,
          //         dropdownPadding: null,
          //         dropdownDecoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(14),
          //           color: Colors.redAccent,
          //         ),
          //         dropdownElevation: 8,
          //         scrollbarRadius: const Radius.circular(40),
          //         scrollbarThickness: 6,
          //         scrollbarAlwaysShow: true,
          //         offset: const Offset(-20, 0),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

}
