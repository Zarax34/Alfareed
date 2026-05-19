const express = require('express');
const router = express.Router();

router.post('/register', (req, res) => res.json({ message: 'User registered (Mock)' }));
router.post('/login', (req, res) => res.json({ token: 'mock-token', role: 'admin' }));

module.exports = router;