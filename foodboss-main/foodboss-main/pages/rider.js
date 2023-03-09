import axios from 'axios'
import Head from 'next/head'
import React from 'react'
import FooterHome from '../components/common/Footer-home'
import RiderJoin from '../components/common/riderJoin'
import Benefits from '../components/home/Benefits'
import FeatureSeller from '../components/home/FeatureSeller'
import HeroHome from '../components/home/HeroSection'
import ScreenshotSection from '../components/home/Screenshots'
import SellerRiderTesti from '../components/home/SellerRiderTesti'
import Video from '../components/home/Video'

const Rider = ({heroData,featuresData,testimonialData,screenshotsData,videoData,stepsData,benifitsData}) => {
  return (
    <>
    <Head>
      <title>Foodboss Rider: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Rider"/>
    </Head>
        <HeroHome data={heroData}/>
        <FeatureSeller data={featuresData}/>
        <Benefits data={benifitsData}/>
        <RiderJoin data={stepsData}/>
        <Video data={videoData}/>
        <ScreenshotSection data={screenshotsData}/>
        <SellerRiderTesti data={testimonialData}/>
        <FooterHome/>
    </>
  )
}

export default Rider

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
      steps:null,
      benifits:null,
    }
    try {
      const hero = (await axios.get('https://admin.foodboss.in/api/heroes?filters[type]=rider&populate=*')).data;
      data.hero = hero;
      const features = (await axios.get('https://admin.foodboss.in/api/features?filters[page_feature][pagename][$eq]=rider&populate=*')).data;
      data.features = features;
      const ss = (await axios.get('https://admin.foodboss.in/api/screenshots?filters[pageName]=rider&populate=*')).data;
      data.screenshots = ss;
      const testi = (await axios.get('https://admin.foodboss.in/api/testimonials?filters[page_testimonial][pageName][$eq]=rider&populate=*')).data;
      data.testimonials = testi;
      const videomain = (await axios.get('https://admin.foodboss.in/api/videos?filters[pageName][$eq]=rider&populate=*')).data;
      data.videos = videomain;
      const stepsMain = (await axios.get('https://admin.foodboss.in/api/page-steps?filters[page][$eq]=rider&populate=*')).data;
      const stepsMainData = (await axios.get('https://admin.foodboss.in/api/steps?filters[page_step][page][$eq]=rider&populate=*')).data;
      const stepsMainFinal = {data: stepsMain.data.map(e=>({...e,attributes: {...e.attributes,steps: stepsMainData}})) };
      data.steps = stepsMainFinal;
      const benifits = (await axios.get('https://admin.foodboss.in/api/benifits?filters[page_benifit][name][$eq]=rider&populate=*')).data;
      data.benifits = benifits;
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {heroData:data.hero,featuresData:data.features,testimonialData:data.testimonials,screenshotsData:data.screenshots,videoData:data.videos,stepsData:data.steps,benifitsData:data.benifits}, // will be passed to the page component as props
  }
}
