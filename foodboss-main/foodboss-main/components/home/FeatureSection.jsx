import Image from "next/image";
import React from "react";
import { AiFillAndroid } from "react-icons/ai";

const FeatureHome = ({data}) => {
  // console.log(data);
  return (
    <>
      <div className="featureSection h-auto min-h-screen flex flex-col gap-12">
        <h2 className="featureTitle text-3xl text-[#F77B54] font-bold my-0 mx-auto pt-32">
          Our Features
        </h2>
        <div className="card-wrapper px-10 flex gap-4 flex-wrap w-full h-auto justify-center items-center py-12">
        {
          data?.data?.map(
            (element,i) =>{ 
              console.log(i,element?.attributes?.icon?.data?.attributes?.url);
            return <div className="card w-full lg:w-1/5 md:w-1/3 h-80 flex flex-col gap-4 items-center text-center p-8" key={i}>
            {/* <AiFillAndroid className="card-icon bg-[#F77B54] rounded-full w-24 h-24 p-4 fill-white" /> */}
            <div className="w-24 h-24 p-5 bg-[#F77B54] rounded-full">
            {
              element?.attributes?.icon?.data?.attributes?.url?<Image className="border-none" src={element?.attributes?.icon?.data?.attributes?.url} alt={element?.attributes?.Heading} width={"20px"} height={"20px"} layout="responsive"/>:null
            }
            </div>
            <span className="card-heading">{element?.attributes?.Heading}</span>
            <span className="card-detail">
            {element?.attributes?.Description}
            </span>
          </div>
          }
          )
        }
        </div>
      </div>
    </>
  );
};

export default FeatureHome;
