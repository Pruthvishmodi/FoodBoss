import React from 'react'
import Slider from 'react-slick'

const CitiSlider2 = ({data={}}) => {
    const settings = {
        infinite: true,
    // lazyLoad: true,
    speed: 1500,
    slidesToShow: 4,
    autoplay: true,
    autoplaySpeed: 1500,
    variableWidth: true,
    infinite:true,
    responsive: [
      // {
      //   breakpoint: 801,
      //   settings: {
      //     slidesToShow: 2,
      //     slidesToScroll: 1,
      //     infinite: true,
      //   },
      // },
      {
        breakpoint: 450,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          infinite: true,
        },
      },
    ],

    }
    // console.log(navigator.userAgent);
  return (
    <div className='w-full pt-10 pb-10 lg:pb-0 lg:pt-16'>
        <div className='w-full max-w-6xl mx-auto overflow-x-hidden'>
        <Slider {...settings} >
            {
                data?.data?.map(
                    (e,i)=><div className="citySlide px-10" key={i}>
                    <div className="city-wrapper w-auto overflow-x-hidden flex gap-5 items-center">
                      <img src={e?.attributes?.cityIcon?.data[0]?.attributes?.url} alt="" className='h-10 w-10'/>
                            <h1 className='text-5xl leading-[4rem] text-white'>{e?.attributes?.city}</h1>
                    </div>
                      </div>
                )
            }
            
        </Slider>
            
            </div>
    </div>
  )
}

export default CitiSlider2