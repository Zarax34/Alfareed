
'use client';
import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function AdminDashboard() {
  const [orders, setOrders] = useState([]);
  useEffect(() => {
    axios.get('http://your-api-url.com/api/orders').then(res => setOrders(res.data));
  }, []);
  return (
    <div className='p-8 bg-white min-h-screen font-sans'>
      <h1 className='text-3xl font-bold text-[#D4A373] mb-6'>لوحة تحكم المدير</h1>
      <div className='grid grid-cols-1 gap-4'>
        {orders.map(order => (
          <div key={order.id} className='p-4 border rounded-lg flex justify-between items-center shadow-sm'>
            <div>
              <p className='font-bold'>طلب رقم: {order.id}</p>
              <p className='text-sm text-gray-500'>الحالة: {order.status}</p>
              <a href={order.payment_screenshot_url} target='_blank' className='text-blue-500 underline'>مشاهدة الإيصال</a>
            </div>
            <div className='flex gap-2'>
              <button className='bg-green-500 text-white px-4 py-2 rounded'>تأكيد</button>
              <button className='bg-red-500 text-white px-4 py-2 rounded'>رفض</button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
