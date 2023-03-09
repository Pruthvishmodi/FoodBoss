import React from "react";
import AboutUs from "../components/common/about";
import FooterHome from "../components/common/Footer-home";
import Head from 'next/head';
import markdownToHtml from '../layouts/markHtml';
import axios from 'axios';

const About = ({aboutData}) => {
  return (
    <>
    <Head>
      <title>About Foodboss: Grocery Ka Boss</title>
      <meta name="description" content="About Foodboss: Grocery Ka Boss"/>
    </Head>
      <AboutUs data={aboutData}/>
      <FooterHome />
    </>
  );
};

export default About;

export const getServerSideProps = async({req,res})=>{
  res.setHeader(
      'Cache-Control',
      'public, s-maxage=10, stale-while-revalidate=50'
    );
    const data = {
      about:null
    }
    try {
      let about = await axios.get('https://admin.foodboss.in/api/abouts?populate=*');



      console.log(about);
      const convertFunc = async (data)=>{
        const demo = data.data.map(
          async e => ({...e,attributes:{...e.attributes,description:await markdownToHtml(e.attributes.description)}})
        );
        return await Promise.all(demo);
      };
      about  = await convertFunc(about.data);
      data.about = about;
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {aboutData:data.about}, // will be passed to the page component as props
  }
}