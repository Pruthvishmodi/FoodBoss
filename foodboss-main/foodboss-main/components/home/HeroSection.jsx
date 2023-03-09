import React, { useEffect } from "react";

const HeroHome = ({data}) => {
  useEffect(()=> {
    // const data = heroData();
    // console.log(data);
  },[]);
  
  return (
    <>
      <div className="Hero bg-[url('/veg-dark-bg.png')] bg-cover w-full pt-40 h-auto lg:h-screen pb-4">
        <div className="hero-wrapper max-w-6xl flex justify-between items-start  w-full mx-auto my-0">
          <div className="hero-left w-1/2 h-auto pt-20">
            <div className="hero-name lg:items-start items-center flex flex-col">
              <h2 className="hero-left-first text-slate-200 font-bold text-2xl">
                {
                  data?.data[0]?.attributes?.tag
                }
              </h2>
              <h1 className="hero-title text-[#F77B54] font-bold text-6xl mt-3">
                {
                  data?.data[0]?.attributes?.heading
                }
              </h1>
              <p className=" text-slate-200 mt-5 w-full lg:w-2/3">
                {
                  data?.data[0]?.attributes?.Description
                }
              </p>
            </div>
            <div className="d-button flex gap-10 mt-10">
              <a href={data?.data[0]?.attributes?.android} target='_blank'>
                <img src={`${data?.data[0]?.attributes?.button?.data[0]?.attributes?.url}`} alt="" width={200} />
              </a>
              <a href={data?.data[0]?.attributes?.ios} target='_blank'>
                <img src={`${data?.data[0]?.attributes?.button?.data[1]?.attributes?.url}`} alt="" width={195} />
              </a>
            </div>
          </div>
          <div className="hero-right w-1/2 h-auto">
            <img
              src={`${data?.data[0]?.attributes?.images?.data[0]?.attributes?.url}`}
              className="mr-0 lg:mr-0 w-full h-auto"
              alt=""
              width={500}
            />
          </div>
        </div>
      </div>
      {/* </div> */}
    </>
  );
};

export default HeroHome;
