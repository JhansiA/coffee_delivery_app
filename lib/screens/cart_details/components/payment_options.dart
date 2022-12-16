import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { onlineBanking, creditCard }

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  PaymentMethod? paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentDetails(
          paymentMethod: paymentMethod,
          payment: PaymentMethod.onlineBanking,
          text: 'Online Banking',
          subtext: 'maybank2u (one-time)',
          onChanged: (value) {
            setState(() {
              paymentMethod = value;
            }); //selected value
          },
          childWidget: [
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/icons/fpx.png',
              alignment: Alignment.center,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        PaymentDetails(
          paymentMethod: paymentMethod,
          payment: PaymentMethod.creditCard,
          text: 'Credit Card',
          subtext: '2540 xxxx xxxx 2648',
          onChanged: (value) {
            setState(() {
              paymentMethod = value;
            }); //selected value
          },
          childWidget: [
            Image.asset(
              'assets/icons/visa.png',
              alignment: Alignment.center,
            ),
            Image.asset(
              'assets/icons/masterCard.png',
              alignment: Alignment.center,
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    super.key,
    required this.payment,
    required this.text,
    required this.subtext,
    required this.childWidget,
    required this.paymentMethod,
    required this.onChanged,
  });

  final PaymentMethod payment;
  final String text, subtext;
  final List<Widget> childWidget;
  final PaymentMethod? paymentMethod;
  final Function(PaymentMethod?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: 70,
      decoration: kCartItemContainerDecor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return kSecondaryBackgroundColor.withOpacity(.32);
              }
              return kSecondaryBackgroundColor;
            }),
            value: payment,
            groupValue: paymentMethod,
            onChanged: onChanged,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: const TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 6,
              ),
              Text(
                subtext,
                style: const TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Row(children: childWidget),
        ],
      ),
    );
  }
}
