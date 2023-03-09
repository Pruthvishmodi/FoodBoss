import Image from 'next/image'
import React from 'react'
import { AiFillAndroid } from 'react-icons/ai'

const RiderJoin = ({data={}}) => {
  return (
    <div className='RiderJoinWrapper relative h-auto lg:h-80v justify-center items-center flex flex-col gap-12 pt-12'>
        <h2 className='text-3xl text-center static lg:absolute top-48 z-10 text-black lg:text-white font-bold left px-4 lg:p-0 w-full'>{data?.data[0]?.attributes?.title}</h2>
        <img className='JoinBG absolute top-24 hidden lg:flex h-96 brightness-50 w-[80%] rounded-xl' src={data?.data[0]?.attributes?.background?.data?.attributes?.url} alt={data?.data[0]?.attributes?.title} />
        <div className='card-wrapper static lg:absolute top-60 px-10 flex gap-4 flex-wrap w-full h-auto justify-center items-center py-12'>
            {
                data?.data[0]?.attributes?.steps?.data?.map((e,i)=><div className="cardJoin w-full lg:w-1/5 md:w-1/3 h-72 flex flex-col gap-4 items-center text-center p-8">
                {/* <AiFillAndroid className="card-icon bg-[#F77B54] rounded-full w-24 h-24 p-4 fill-white" /> */}
                <div className='w-20 h-20'>
                    <Image src={e?.attributes?.icon?.data?.attributes?.url} alt={e?.attributes?.title} width={'100px'} height={'100px'} layout='responsive'/>
                </div>
                <h2 className='join-heading font-bold text-2xl'>{e?.attributes?.title}</h2>
                <h3 className='join-desc'>{e?.attributes?.description}</h3>
            </div>)
            }
            
            {/* <div className="cardJoin w-full lg:w-1/5 md:w-1/3 h-72 flex flex-col gap-4 items-center text-center p-8">
                <AiFillAndroid className="card-icon bg-[#F77B54] rounded-full w-24 h-24 p-4 fill-white" />
                <h2 className='join-heading font-bold text-2xl'>Step1</h2>
                <h3 className='join-desc'>Download food delivery app</h3>
            </div>
            <div className="cardJoin w-full lg:w-1/5 md:w-1/3 h-72 flex flex-col gap-4 items-center text-center p-8">
                <AiFillAndroid className="card-icon bg-[#F77B54] rounded-full w-24 h-24 p-4 fill-white" />
                <h2 className='join-heading font-bold text-2xl'>Step1</h2>
                <h3 className='join-desc'>Download food delivery app</h3>
            </div> */}
        </div>
    </div>
  )
}

export default RiderJoin