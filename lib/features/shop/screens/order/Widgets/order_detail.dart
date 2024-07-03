import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Chi tiết đơn hàng'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order ID
              Row(
                children: [
                  const Expanded(
                      child: Text('Mã đơn hàng:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text(order.id, textAlign: TextAlign.right)),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),
              // Order Status
              Row(
                children: [
                  const Expanded(
                      child: Text('Trạng thái:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text(order.orderStatusText.toString(),
                          textAlign: TextAlign.right)),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),
              // Total Amount
              Row(
                children: [
                  const Expanded(
                      child: Text('Tổng tiền:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                    child: Text(
                      TFormatter.formatCurrency(order.totalAmount),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),
              // Order Date
              Row(
                children: [
                  const Expanded(
                      child: Text('Ngày đặt hàng:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text(TFormatter.formatDate(order.orderDate),
                          textAlign: TextAlign.right)),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),
              // Payment Method
              Row(
                children: [
                  const Expanded(
                      child: Text('Phương thức thanh toán:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text(order.paymentMethod,
                          textAlign: TextAlign.right)),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),
              // Delivery Address
              if (order.address != null) ...[
                const Text('Địa chỉ giao hàng:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(order.address!.toString()),
                const SizedBox(height: TSizes.defaultSpace),
              ],

              // Delivery Date
              if (order.deliveryDate != null) ...[
                Row(
                  children: [
                    const Expanded(
                        child: Text('Ngày giao hàng dự kiến:',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(TFormatter.formatDate(order.deliveryDate!),
                            textAlign: TextAlign.right)),
                  ],
                ),
                const SizedBox(height: TSizes.defaultSpace),
              ],
              // Order Items
              const Text('Sản phẩm:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: TSizes.defaultSpace),
              Column(
                children: order.items
                    .map((item) => ListTile(
                          leading: item.image != null
                              ? Image.network(item.image!,
                                  width: 50, height: 50, fit: BoxFit.cover)
                              : null,
                          title: Text(item.title),
                          subtitle: Text('Số lượng: ${item.quantity}'),
                          trailing: Text(TFormatter.formatCurrency(item.price)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
