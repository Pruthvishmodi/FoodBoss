import axios from 'axios'
import Head from 'next/head'
import React from 'react'
import FooterHome from '../components/common/Footer-home'
import HeroHome from '../components/home/HeroSection'
import ScreenshotSection from '../components/home/Screenshots'
import SellerRiderTesti from '../components/home/SellerRiderTesti'
import SSFeature from '../components/home/SSFeature'
import Video from '../components/home/Video'

const Seller = ({heroData,featuresData,testimonialData,screenshotsData,videoData,benifitsData}) => {
  console.log('dddd',heroData);
  return (
    <>
    <Head>
      <title>Foodboss Seller: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Seller"/>
    </Head>
        <HeroHome data={heroData}/>
        <SSFeature data={featuresData}/>
        <ScreenshotSection data={screenshotsData}/>
        <Video data={videoData}/>
        <SellerRiderTesti data={testimonialData}/>
        <FooterHome/>
    </>
  )
}

export default Seller

export const getServerSideProps = async({req,res})=>{
  res.setHeader(
      'Cache-Control',
      'public, s-maxage=10, stale-while-revalidate=50'
    );
    const data = {
      hero:null,
      features:null,
      testimonials:null,
      screenshots:null,
      videos:null,
      benifits:null
    }
    try {

      const hero = (await axios.get('https://admin.foodboss.in/api/heroes?filters[type]=seller&populate=*')).data;
      data.hero = hero;
      const features = (await axios.get('https://admin.foodboss.in/api/features?filters[page_feature][pagename][$eq]=seller&populate=*')).data;
      data.features = features;
      const ss = (await axios.get('https://admin.foodboss.in/api/screenshots?filters[pageName]=seller&populate=*')).data;
      data.screenshots = ss;
      const testi = (await axios.get('https://admin.foodboss.in/api/testimonials?filters[page_testimonial][pageName][$eq]=seller&populate=*')).data;
      data.testimonials = testi;
      const videomain = (await axios.get('https://admin.foodboss.in/api/videos?filters[pageName][$eq]=seller&populate=*')).data;
      data.videos = videomain;
      const benifits = (await axios.get('https://admin.foodboss.in/api/benifits?filters[page_benifit][name][$eq]=seller&populate=*')).data;
      data.benifits = benifits;
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {heroData:data.hero,featuresData:data.features,testimonialData:data.testimonials,screenshotsData:data.screenshots,videoData:data.videos,benifitsData:data.benifits}, // will be passed to the page component as props
  }
}
