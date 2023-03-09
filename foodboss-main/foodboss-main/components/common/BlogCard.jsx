import moment from 'moment'
import Image from 'next/image'
import Link from 'next/link'
import React from 'react'

const BlogCard = ({val}) => {
  return (
  <Link key={val?.id} href={`/blogs-by-foodboss/${val?.id}`}>
  <div className='flex-1 min-w-[50%] lg:min-w-[30%] bg-gray-700 rounded-xl cursor-pointer'>
  <div className='w-full h-auto'>
    {
    val?.img!=null && val?.img!==undefined && val?.img!=='undefined' && val?.img!=='null'?
    
    <Image className='rounded-xl rounded-b-none' src={val?.img} width={100} height={70} layout='responsive'/> 
    :null
    }
      {/* <img src={getImg(val?.attributes?.image?.data?.attributes?.url)}></img> */}
  </div>
  <p className='w-full px-5 py-2 font-semibold text-[#F77B54]'>{moment(val?.date).format("MM-DD-YYYY")}</p>
  <h2 className='font-bold px-5 py-2 text-gray-100 text-xl'>{val?.title?.slice(0,35)+'...'}</h2>
  <p className='font-normal px-5 py-2 text-lg text-gray-400'>By {val?.publisher}</p>
  </div>
</Link>
  )
}

export default BlogCard