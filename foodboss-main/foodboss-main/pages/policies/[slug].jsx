import React from 'react'
import markdownToHtml from '../../layouts/markHtml';
import MarkdownLayout from '../../layouts/markdown';
import axios from 'axios';

const PolicyIndividual = ({policy}) => {
  return (
    <main className='w-full pt-40 bg-black'>
        <section className='w-[80%] max-w-[1920px] mx-auto flex flex-col items-center gap-10'>
        <h1 className='text-2xl font-bold text-white'>{policy?.attributes?.policyName}</h1>
        <MarkdownLayout content={policy?.attributes?.policyContent} />
        </section>
    </main>
  )
}

export default PolicyIndividual;

export const getServerSideProps = async({req,res,params})=>{
    res.setHeader(
        'Cache-Control',
        'public, s-maxage=10, stale-while-revalidate=50'
      );
      let policy = {}
      try {
        const hero = await axios.get('https://admin.foodboss.in/api/policies?filters[slug][$eq]='+params.slug);
        policy = {...hero?.data.data[0],attributes:{...hero?.data.data[0].attributes,policyContent: await markdownToHtml(hero?.data.data[0].attributes.policyContent)}};
        console.log(policy);
        if (policy==null) {
            return {
                redirect:{
                    permanent:false,
                    destination:'/404',
                },
                props:{},
            }
        }
      } catch (error) {
        console.log('home',error);
        return {
            redirect:{
                permanent:false,
                destination:'/404',
            },
            props:{},
        }
      }
    return {
      props: {policy:policy}, // will be passed to the page component as props
    }
  }