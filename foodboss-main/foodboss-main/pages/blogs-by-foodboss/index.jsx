import React from 'react'
import BlogList from '../../components/blog/blogList'
import {blogsURL} from '../../functions/url'
import ApolloProvider from '../../functions/apolloProvider';
import Head from 'next/head';
import axios from 'axios';

const Blogs = ({blogData}) => {
  return (
    <>
    <Head>
      <title>Foodboss: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Blogs"/>
    </Head>
    <BlogList blogData={blogData?.data}/>
    </>
  )
}

export default Blogs


export const getServerSideProps = async({req,res})=>{
    res.setHeader(
        'Cache-Control',
        'public, s-maxage=10, stale-while-revalidate=50'
      );
      const data = {
        blogs:null,
      }
      try {
        // const {data: blogs} = await ApolloProvider.query({
        //   query: blogsURL
        // });

        const blogs = (await axios.get('https://admin.foodboss.in/api/blogs?populate=*')).data;
        
        data.blogs = blogs;
      } catch (error) {
        console.log('home',error);
        
    }
    console.log('home',data.blogs);
    return {
      props: {blogData:data.blogs}, // will be passed to the page component as props
    }
  }
  