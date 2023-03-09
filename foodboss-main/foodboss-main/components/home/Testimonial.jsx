import { useMemo, useState } from "react";
import Slider from "react-slick";
import { FaArrowRight, FaArrowLeft } from "react-icons/fa";
import ScreenshotSection from "./Screenshots";


const  TestimonialMain=({data})=> {
  const images = useMemo(()=>([
    {
      img: "/testi-img1.jpg",
      text: "As a brand owner, we have partnered with Dotcom Reps since 2014 and have experienced steady growth and profitability with Amazon. They have provided us a seamless path to positioning and controlling our brand. We would highly recommend their services.",
      name: "Rohini Patel",
      role: "Analyst"
    },
    {
      img: "/testi-img1.jpg",
      text: "As a brand owner, we have partnered with Dotcom Reps since 2014 and have experienced steady growth and profitability with Amazon. They have provided us a seamless path to positioning and controlling our brand. We would highly recommend their services.",
      name: "Shreya Patel",
      role: "Analyst"
    },
    {
      img: "/testi-img1.jpg",
      text: "As a brand owner, we have partnered with Dotcom Reps since 2014 and have experienced steady growth and profitability with Amazon. They have provided us a seamless path to positioning and controlling our brand. We would highly recommend their services.",
      name: "Tanu Jain",
      role: "Analyst"
    },
    {
      img: "/testi-img1.jpg",
      text: "As a brand owner, we have partnered with Dotcom Reps since 2014 and have experienced steady growth and profitability with Amazon. They have provided us a seamless path to positioning and controlling our brand. We would highly recommend their services.",
      name: "Hetal Agrawal",
      role: "Analyst"
    },
  ]),[]);
  const NextArrow = ({ onClick }) => {
    return (
      <div className="arrow next" onClick={onClick}>
        <FaArrowRight fill="white" />
      </div>
    );
  };

  const PrevArrow = ({ onClick }) => {
    return (
      <div className="arrow prev" onClick={onClick}>
        <FaArrowLeft fill="white" />
      </div>
    );
  };

  const [imageIndex, setImageIndex] = useState(0);

  const settings = useMemo(() => ({
    infinite: true,
    lazyLoad: true,
    speed: 300,
    slidesToShow: 3,
    autoplay: true,
    autoplaySpeed: 2000,
    centerMode: true,
    centerPadding: 0,
    nextArrow: <NextArrow />,
    prevArrow: <PrevArrow />,
    beforeChange: (current, next) => setImageIndex(next),
    responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            dots: true
          }
        },
    ]
  }));

  return (
    <>
      <div className="testimonialSection px-4 lg:h-screen h-auto flex flex-col gap-12 pt-16 py-8">
        <h2 className="testimonial-title text-3xl text-[#F77B54] font-bold my-0 mx-auto pt-0 lg:pt-32">
          Testimonials
        </h2>
      {/* <ScreenshotSection data={ssData}/> */}
        <div className="Testi-slider w-full lg:w-3/4 mx-auto">
          <Slider {...settings}>
            {data?.data?.map((element, idx) => (
              <>
                <div className={idx === imageIndex ? "slide1 activeSlide1" : "slide1"}>
                  <p className="testi-text text-center font-medium">{element?.attributes?.message}</p>
                </div>
                <div className={idx === imageIndex ? "slide activeSlide" : "slide"}>
                  <img src={`${element?.attributes?.image?.data?.attributes?.url}`} alt="" />
                </div>
                <div className={idx === imageIndex ? "slide activeSlide1" : "slide1"}>
                  <hr className="hr-line"/>
                </div>
                <div className={idx === imageIndex ? "slide1 activeSlide1" : "slide1"}>
                  <p className="testi-name text-white text-center font-bold pt-4">{element?.attributes?.name}</p>
                </div>
                <div className={idx === imageIndex ? "slide1 activeSlide1" : "slide1"}>
                  <p className="testi-role text-white text-center text-sm">{element?.attributes?.tag}</p>
                </div>
              </>
            ))}
          </Slider>
        </div>
      </div>
    </>
  );
}

export default TestimonialMain;
