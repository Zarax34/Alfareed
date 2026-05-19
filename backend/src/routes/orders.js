const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');
const { verifyToken, isAdmin, isDelivery } = require('../middlewares/authMiddleware');
router.post('/', verifyToken, orderController.createOrder);
router.patch('/:id/status', verifyToken, isAdmin, orderController.adminUpdateOrderStatus);
router.get('/delivery', verifyToken, isDelivery, orderController.getDeliveryOrders);
module.exports = router;