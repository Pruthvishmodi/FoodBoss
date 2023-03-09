import Link from 'next/link'
import React from 'react'

const NotFound = () => {
  return (
    <main className='w-full h-screen flex flex-col items-center justify-center gap-4'>
        <h1 className='text-2xl fot-bold'>Opps! Not found</h1>
        <Link href={'/'}><p className='text-lg font-semibold text-red-500 cursor-pointer'>Go to Home</p></Link>
    </main>
  )
}

export default NotFound