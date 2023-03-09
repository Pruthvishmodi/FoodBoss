import React from 'react'
import MarkdownLayout from '../../layouts/markdown'

const AboutUs = ({data={}}) => {
  return (
    <div className='about-wrapper p-4 lg:p-40 w-full bg-black'>
        <h1 className='about-title text-[#F77B54] font-extrabold text-3xl mx-auto mb-10 w-full text-center'>About us</h1>
        {
          data?.map((e,i)=><div key={i} className={`about-content flex gap-12 w-full flex-col ${i%2===0?'lg:flex-row-reverse':'lg:flex-row'} items-center mt-24`}>
          <img className='w-full lg:w-[48%]' src={e?.attributes?.image?.data?.attributes?.url} alt={e?.attributes?.image?.data?.attributes?.name} />
          <MarkdownLayout content={e?.attributes?.description} />
          {/* <p className='text-white w-full lg:w-[48%]'>{e?.attributes?.description}</p> */}
      </div>)
        }
    </div>
  )
}

export default AboutUs