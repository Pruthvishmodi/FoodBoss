import React from 'react'
import BlogCard from '../common/BlogCard'

const BlogList = ({blogData=[]}) => {
  return (
    <div className='lg:p-40 py-40 p-4 w-full bg-black'>
        <h1 className='text-[#F77B54] font-extrabold text-3xl mx-auto mb-10 w-full text-center'>Foodboss Blogs</h1>
        <div className='w-full max-w-4xl mx-auto flex flex-row  flex-wrap gap-4'>
        {
            blogData?.map(
                e=><BlogCard val={{id:e?.id,title:e?.attributes?.title,img:`${e?.attributes?.image?.data?.attributes?.url}`,publisher:e?.attributes?.author,date:e?.attributes?.publish}}/>
                )
            }
        </div>
    </div>
  )
}

export default BlogList