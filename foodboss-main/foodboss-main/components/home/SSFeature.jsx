import React from 'react'

const SSFeature = ({data={}}) => {
  return (
    <>
    <h2 className="lg:block featureTitle text-center text-3xl text-[#F77B54] font-bold my-0 mx-auto pt-16 lg:pt-32">
          Features
      </h2>
      <div className="SSFeature-wrapper flex lg:flex-row h-auto py-8 lg:h-screen flex-col gap-4 lg:gap-0 justify-center items-center">

              <div className="SSFeature-left flex flex-col gap-4 lg:gap-16 px-4">
                  {
                      data?.data?.slice(0,3)?.map(
                          (e,i)=><div className="indi-feature flex flex-row items-start lg:gap-4">
                          <div className="feature-head flex flex-col lg:items-end flex-wrap w-full lg:w-64">
                              <h2 className='feature-h2 pb-2 text-base font-semibold'>{e?.attributes?.Heading}</h2>
                              <p className='feature-desc lg:text-right font-light'>{e?.attributes?.Description}</p>
                          </div>
                          <div className="feature-dotLine flex flex-row items-center">
                              <div className="round w-4 h-4 bg-[#F77B54] rounded-full"></div>
                              <hr className='feature-line w-32 border-[#F77B54]' />
                          </div>
                      </div>
                      )
                  }
              </div>
              <div className="SSFeature-center">
                  <img src="/fb-ssfeature.png" alt="" width={300} />
              </div>
              <div className="SSFeature-right flex flex-col gap-4 lg:gap-16 px-4">
              {
                      data?.data?.slice(3,6)?.map(
                          (e,i)=><div className="indi-feature flex flex-row items-start lg:gap-4">
                          <div className="feature-dotLine flex flex-row items-center">
                          <hr className='feature-line w-32 border-[#F77B54]' />
                          <div className="round w-4 h-4 bg-[#F77B54] rounded-full"></div>
                      </div>
                      <div className="feature-head flex flex-col items-start flex-wrap w-full lg:w-64">
                          <h2 className='feature-h2 pb-2 text-base font-semibold'>{e?.attributes?.Heading}</h2>
                          <p className='feature-desc text-left font-light'>{e?.attributes?.Description}</p>
                      </div>
                      </div>
                      )
                  }
              </div>
          </div></>
  )
}

export default SSFeature