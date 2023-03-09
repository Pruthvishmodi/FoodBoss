import axios from 'axios';
import Head from 'next/head';
import React from 'react'
import SellerSupport from '../components/home/SupportSeller'

const Usercontact = ({supportData}) => {
  return (
    <>
    <Head>
      <title>Foodboss: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Customer"/>
    </Head>
        <SellerSupport data={supportData}/>
    </>
  )
}

export default Usercontact

export const getServerSideProps = async({req,res})=>{
  res.setHeader(
      'Cache-Control',
      'public, s-maxage=10, stale-while-revalidate=50'
    );
    const data = {
      support:null,
    }
    try {
      const hero = (await axios.get('https://admin.foodboss.in/api/page-supports?filters[pageName][$eq]=customer')).data;
      const heroData = (await axios.get('https://admin.foodboss.in/api/supports?filters[page_support][pageName][$eq]=customer&populate=*')).data;
      data.support = { ...hero, data : hero.data?.map(e=>({...e,attributes:{...e.attributes,supports:heroData}}))};
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {supportData:data.support}, // will be passed to the page component as props
  }
}