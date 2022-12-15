import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { onlineBanking, creditCard }

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    Key? key,
  }) : super(key: key);

  // PaymentMethod? _method = PaymentMethod.onlineBanking;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentDetails(
          // method: _method,
          payment: PaymentMethod.onlineBanking,
          text: 'Online Banking',
          subtext: 'maybank2u (one-time)',
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
          // method: _method,
          payment: PaymentMethod.creditCard,
          text: 'Credit Card',
          subtext: '2540 xxxx xxxx 2648',
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

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({
    super.key,
    // this.method,
    required this.payment,
    required this.text,
    required this.subtext,
    required this.childWidget,
  });

  // final PaymentMethod? method;
  final PaymentMethod payment;
  final String text, subtext;
  final List<Widget> childWidget;

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  PaymentMethod? _method = PaymentMethod.onlineBanking;

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
              value: widget.payment,
              groupValue: _method,
              onChanged: (value) {
                setState(() {
                  _method = value;
                  print(_method);
                }); //selected value
              }),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text,
                  style: const TextStyle(
                      color: kPrimaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.subtext,
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
          Row(children: widget.childWidget),
        ],
      ),
    );
  }
}
