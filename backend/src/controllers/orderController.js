
const { Order, OrderItem } = require('../models');

exports.createOrder = async (req, res) => {
    try {
        const { customer_id, items, delivery_address, phone, payment_screenshot_url } = req.body;
        const order = await Order.create({
            customer_id,
            status: 'pending',
            delivery_address,
            phone,
            payment_screenshot_url,
            total_amount: items.reduce((sum, item) => sum + item.price * item.quantity, 0)
        });
        await OrderItem.bulkCreate(items.map(item => ({ order_id: order.id, ...item })));
        res.status(201).json(order);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

exports.adminUpdateOrderStatus = async (req, res) => {
    try {
        const { status, rejection_reason } = req.body;
        await Order.update({ status, rejection_reason }, { where: { id: req.params.id } });
        res.json({ message: `Order status updated to ${status}` });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

exports.getDeliveryOrders = async (req, res) => {
    try {
        const orders = await Order.findAll({ where: { status: 'confirmed' } });
        res.json(orders);
    } catch (error) {
        res.status(500).json({ error: 'Internal Server Error' });
    }
};
