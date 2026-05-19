
# Al-Farid Honey System Architecture

## 1. Database Schema (PostgreSQL)
- **Users**: (id, username, email, password, role [customer, admin, delivery], phone, address)
- **Products**: (id, name, description, price, stock_quantity, image_url, category [sidr, flowers, etc], is_active)
- **Orders**: (id, customer_id, total_amount, status [pending, confirmed, delivering, delivered, rejected], delivery_address, phone, payment_screenshot_url, rejection_reason, created_at)
- **Order_Items**: (id, order_id, product_id, quantity, unit_price)
- **Store_Settings**: (id, is_open, closing_time, special_closing_date)
- **Reviews**: (id, user_id, product_id, rating, comment)

## 2. API Endpoints (REST)
### Auth
- POST /api/auth/register
- POST /api/auth/login

### Customer
- GET /api/products (filtered, searched)
- GET /api/products/:id
- POST /api/orders (create order + upload screenshot)
- GET /api/orders/my-orders
- POST /api/reviews

### Admin
- POST /api/admin/products (create/edit/delete)
- PATCH /api/admin/store-settings (open/close store)
- GET /api/admin/orders (all orders with screenshots)
- PATCH /api/admin/orders/:id/status (confirm/reject)
- POST /api/admin/users (create delivery/admin)
- GET /api/admin/reports (sales, activity)

### Delivery
- GET /api/delivery/orders (confirmed orders only)
- PATCH /api/delivery/orders/:id/status (delivering -> delivered)

## 3. Flow Logic
Customer -> Add to Cart -> Checkout -> Upload Payment Proof -> Order 'Pending'
Admin -> Verify Proof -> Confirm -> Order 'Confirmed' -> Notify Delivery
Delivery -> Pick Up -> Mark as 'Delivered' -> Notify Customer
