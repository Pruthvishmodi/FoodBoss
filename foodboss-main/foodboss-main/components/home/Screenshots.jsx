import React from "react";
import { useMemo, useState } from "react";
import Slider from "react-slick";
import apiPic from "../../public/API-icon1.png";
import { FaArrowRight, FaArrowLeft } from "react-icons/fa";
import CitySlider from "./citySlider";
import CitiSlider2 from "./citiSlider2";

const ssImages = [
  "/foodboss-ss1.png",
  "/foodboss-ss2.png",
  "/foodboss-ss3.png",
  "/foodboss-ss4.png",
  "/foodboss-ss5.png",
  "/foodboss-ss2.png",
  "/foodboss-ss4.png",
];

function ScreenshotSection({data,cityData}) {
  const NextArrowSS = ({ onClick }) => {
    return (
      <div className="arrow next" onClick={onClick}>
        <FaArrowRight fill="white" />
      </div>
    );
  };

  const PrevArrowSS = ({ onClick }) => {
    return (
      <div className="arrow prev" onClick={onClick}>
        <FaArrowLeft fill="white" />
      </div>
    );
  };

  const [SSIndex, setSSIndex] = useState(0);

  const settings = useMemo(() => ({
    infinite: true,
    lazyLoad: true,
    speed: 300,
    slidesToShow: 5,
    autoplay: true,
    autoplaySpeed: 2000,
    centerMode: true,
    centerPadding: 0,
    nextArrow: <NextArrowSS />,
    prevArrow: <PrevArrowSS />,
    beforeChange: (current, next) => setSSIndex(next),
    responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            dots: false
          }
        },
    ]
  }));

  return (
    <div className="bg-data-wrapper">
      <CitiSlider2 data={cityData}/>
      <div className="screenshot-wrapper my-bg relative h-auto lg:h-screen flex flex-col gap-16 pb-8">
      <div className="ss-bg">
        <img className="iphone-frame" src="/iphone-x-body.png" alt="" />
      </div>
        <div className="ss-title mx-auto">
          <h2 className="screenshot-title text-3xl text-[#F77B54] font-bold pt-32">
            Screenshots
          </h2>
        </div>
        <div className="ss-slider w-4/5  mx-auto">
          <Slider {...settings}>
            {data?.data[0]?.attributes?.screenshots?.data?.map((SSimg, idxSS) => (
              <div
                className={
                  idxSS === SSIndex ? "SSslide activeSlideSS" : "SSslide"
                }
              >
                <img src={`${SSimg?.attributes?.url}`} alt="" />
              </div>
            ))}
          </Slider>
        </div>
      </div>
    </div>
  );
}

export default ScreenshotSection;
