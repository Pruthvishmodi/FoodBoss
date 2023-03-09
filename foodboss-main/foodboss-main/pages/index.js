import axios from "axios";
import Head from "next/head";
import FooterHome from "../components/common/Footer-home";
import FeatureHome from "../components/home/FeatureSection";
import HeroHome from "../components/home/HeroSection";
import ScreenshotSection from "../components/home/Screenshots";
import TestimonialMain from "../components/home/Testimonial";

export default function Home({heroData,featuresData,testimonialData,screenshotsData,citiesData}) {
  return (
    <>
    <Head>
      <title>Foodboss: Grocery Ka Boss</title>
      <meta name="description" content="Foodboss: Grocery Ka Boss Customer"/>
    </Head>
    <main className='w-full'>
    <HeroHome data={heroData} />
    <FeatureHome data={featuresData}/>
    {/* <CitySlider data={citiesData}/> */}
    {/* <CitySliderTwo data={citiesData}/> */}
    <ScreenshotSection data={screenshotsData} cityData={citiesData}/>
    <TestimonialMain data={testimonialData} />
    <FooterHome/>
    </main>
    </>
  )
}

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
      cities:null,
    }
    try {
      const hero = (await axios.get('https://admin.foodboss.in/api/heroes?filters[type]=customer&populate=*')).data;
      data.hero = hero;
      const features = (await axios.get('https://admin.foodboss.in/api/features?filters[page_feature][pagename][$eq]=customer&populate=*')).data;
      data.features = features;
      const ss = (await axios.get('https://admin.foodboss.in/api/screenshots?filters[pageName]=customer&populate=*')).data;
      data.screenshots = ss;
      const cities = (await axios.get('https://admin.foodboss.in/api/cities?populate=*')).data;
      data.cities = cities;
      const testi = (await axios.get('https://admin.foodboss.in/api/testimonials?filters[page_testimonial][pageName][$eq]=customer&populate=*')).data;
      console.log('city',cities?.cities?.data);
      data.testimonials = testi;
    } catch (error) {
      console.log('home',error);

    }
  return {
    props: {heroData:data.hero,featuresData:data.features,testimonialData:data.testimonials,screenshotsData:data.screenshots,citiesData:data.cities}, // will be passed to the page component as props
  }
}
