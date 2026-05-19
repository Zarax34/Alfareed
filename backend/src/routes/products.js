const express = require('express');
const router = express.Router();

router.get('/', (req, res) => res.json([{ id: 1, name: 'Sider Honey', price: 100 }]));

module.exports = router;