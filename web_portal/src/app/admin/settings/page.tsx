
'use client';
import React, { useState } from 'react';
export default function SettingsPage() {
  const [isOpen, setIsOpen] = useState(true);
  return (
    <div className='p-8 bg-white min-h-screen font-sans'>
      <h1 className='text-3xl font-bold text-[#D4A373] mb-6'>إعدادات المتجر</h1>
      <div className='flex items-center gap-4 p-4 border rounded-lg w-max'>
        <span>حالة المتجر:</span>
        <button onClick={() => setIsOpen(!isOpen)} className={`px-4 py-2 rounded ${isOpen ? 'bg-green-500' : 'bg-red-500'} text-white`}>
          {isOpen ? 'مفتوح الآن' : 'مغلق الآن'}
        </button>
      </div>
    </div>
  );
}
