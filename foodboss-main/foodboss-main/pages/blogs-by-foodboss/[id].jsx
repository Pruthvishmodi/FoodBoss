import Image from 'next/image'
import React from 'react'
import {BsPerson} from 'react-icons/bs'
import moment from 'moment';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import Head from 'next/head';
import axios from 'axios';

const Blog = ({blogData}) => {
  console.log(blogData);
  return (
    <>
    <Head>
      <title>Foodboss: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Blogs"/>
    </Head>
    <div className='w-full h-auto bg-black py-[10rem]'>
      <div className='w-[80%] max-w-5xl mx-auto flex gap-4 flex-col'>
        <div className='w-full h-auto'>
          {
            blogData?.data?.attributes?.image?.data?.attributes?.url?
            <Image className='w-full rounded-md h-auto' src={blogData?.data?.attributes?.image?.data?.attributes?.url} width={100} height={80} layout='responsive'/>
            :null
          }
        </div>
        <div className='w-full text-white h-auto flex flex-col gap-4 p-4 bg-gray-700 shadow rounded-md'>
          <h1 className='w-full text-left text-2xl font-bold'>{blogData?.data?.attributes?.title}</h1>
        <div className='flex w-full h-auto p-2 px-4 items-stretch gap-2 bg-gray-600 rounded-sm'><span className='w-1 rounded bg-white'></span> <h2 className='font-bold'>{moment(blogData?.data?.attributes?.publish).format('dd-mm-yyyy')}</h2></div>
        <div className='flex w-fit h-auto p-2 px-4 items-center gap-2 bg-gray-600 rounded-sm'><BsPerson size={'1rem'} color={'white'}/> <h2 className='font-bold flex w-auto'>{blogData?.data?.attributes?.author}</h2></div>
        <div className='blog-ind'>
                <ReactMarkdown skipHtml={true} remarkPlugins={[remarkGfm]}>{blogData?.data?.attributes?.blog}</ReactMarkdown></div>
        </div>
      </div>
    </div>
      </>
  )
}

export default Blog


export const getServerSideProps = async({req,res,params})=>{
  res.setHeader(
      'Cache-Control',
      'public, s-maxage=10, stale-while-revalidate=50'
    );
    const id = params?.id;
    let data = null;
    try {
      const hero = (await axios.get('https://admin.foodboss.in/api/blogs/'+id+'?populate=*')).data;
      data = hero;
      console.log('home',id);
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {blogData:data}, // will be passed to the page component as props
  }
}