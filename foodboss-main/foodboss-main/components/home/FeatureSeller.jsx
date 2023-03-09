import Image from "next/image";
import React from "react";
import Card from "../common/Card";

const FeatureSeller = ({data}) => {
  // console.log("review",data?.pageFeatures?.data[0]?.attributes?.features?.data?.length>3?1:0);
  return (
    <section className="Feature flex flex-col items-center" id="Features">
      {/* <h1 className="text-red-500 text-xl m-8 pt-8">Our App Feature Lists</h1> */}
      <h2 className="text-3xl font-serif m-8 pt-8">Our App Feature Lists</h2>
      <div className="flex flex-col lg:flex-row items-center justify-center py-8 px-4">
        {
          data?.data?.map(
            (element,i) => <Card
            key={i}
            svg={element?.attributes?.icon?.data?.attributes?.url?<Image src={element?.attributes?.icon?.data?.attributes?.url} alt={element?.attributes?.Heading} width={"20px"} height={"20px"} layout="responsive"/>:null}
            title={element?.attributes?.Heading}
            desc={element?.attributes?.Description}
          />
          )
        }
        {/* <Card
          svg={
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="pl-1"
              height="48"
              width="48"
            >
              <path
                className="fill-white"
                d="M40.5 29.05 36.95 25.5 38.4 24.05Q38.8 23.65 39.45 23.65Q40.1 23.65 40.5 24.05L41.95 25.5Q42.35 25.9 42.35 26.55Q42.35 27.2 41.95 27.6ZM24 42V38.45L34.8 27.65L38.35 31.2L27.55 42ZM6 31.5V28.5H21V31.5ZM6 23.25V20.25H29.5V23.25ZM6 15V12H29.5V15Z"
              />
            </svg>
          }
          title={"Easy to edit"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        />
        <Card
          color="bg-blue-500"
          bColor="border-blue-300"
          svg={
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
              <path
                className="fill-white"
                d="M21.8 30.65 33.2 19.25 31.1 17.2 21.95 26.35 16.9 21.3 14.7 23.5ZM24 43.95Q17 42.2 12.5 35.825Q8 29.45 8 21.85V9.95L24 3.95L40 9.95V21.85Q40 29.45 35.5 35.825Q31 42.2 24 43.95ZM24 24.55Q24 24.55 24 24.55Q24 24.55 24 24.55Q24 24.55 24 24.55Q24 24.55 24 24.55ZM24 40.85Q29.75 38.95 33.375 33.675Q37 28.4 37 21.85V12.05L24 7.15L11 12.05V21.85Q11 28.4 14.625 33.675Q18.25 38.95 24 40.85Z"
              />
            </svg>
          }
          title={"Easy to edit"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        />
        <Card
          color="bg-orange-500"
          bColor="border-orange-300"
          svg={
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
              <path
                className="fill-white"
                d="M11.1 35.25Q14.25 33.05 17.35 31.875Q20.45 30.7 24 30.7Q27.55 30.7 30.675 31.875Q33.8 33.05 36.95 35.25Q39.15 32.55 40.075 29.8Q41 27.05 41 24Q41 16.75 36.125 11.875Q31.25 7 24 7Q16.75 7 11.875 11.875Q7 16.75 7 24Q7 27.05 7.95 29.8Q8.9 32.55 11.1 35.25ZM24 25.5Q21.1 25.5 19.125 23.525Q17.15 21.55 17.15 18.65Q17.15 15.75 19.125 13.775Q21.1 11.8 24 11.8Q26.9 11.8 28.875 13.775Q30.85 15.75 30.85 18.65Q30.85 21.55 28.875 23.525Q26.9 25.5 24 25.5ZM24 44Q19.9 44 16.25 42.425Q12.6 40.85 9.875 38.125Q7.15 35.4 5.575 31.75Q4 28.1 4 24Q4 19.85 5.575 16.225Q7.15 12.6 9.875 9.875Q12.6 7.15 16.25 5.575Q19.9 4 24 4Q28.15 4 31.775 5.575Q35.4 7.15 38.125 9.875Q40.85 12.6 42.425 16.225Q44 19.85 44 24Q44 28.1 42.425 31.75Q40.85 35.4 38.125 38.125Q35.4 40.85 31.775 42.425Q28.15 44 24 44ZM24 41Q26.75 41 29.375 40.2Q32 39.4 34.55 37.4Q32 35.6 29.35 34.65Q26.7 33.7 24 33.7Q21.3 33.7 18.65 34.65Q16 35.6 13.45 37.4Q16 39.4 18.625 40.2Q21.25 41 24 41ZM24 22.5Q25.7 22.5 26.775 21.425Q27.85 20.35 27.85 18.65Q27.85 16.95 26.775 15.875Q25.7 14.8 24 14.8Q22.3 14.8 21.225 15.875Q20.15 16.95 20.15 18.65Q20.15 20.35 21.225 21.425Q22.3 22.5 24 22.5ZM24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65Q24 18.65 24 18.65ZM24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Q24 37.35 24 37.35Z"
              />
            </svg>
          }
          title={"Easy to edit"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        />
        <Card
          color="bg-green-500"
          bColor="border-green-300"
          svg={
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
              <path
                className="fill-white"
                d="M19.4 44 18.4 37.7Q17.45 37.35 16.4 36.75Q15.35 36.15 14.55 35.5L8.65 38.2L4 30L9.4 26.05Q9.3 25.6 9.275 25.025Q9.25 24.45 9.25 24Q9.25 23.55 9.275 22.975Q9.3 22.4 9.4 21.95L4 18L8.65 9.8L14.55 12.5Q15.35 11.85 16.4 11.25Q17.45 10.65 18.4 10.35L19.4 4H28.6L29.6 10.3Q30.55 10.65 31.625 11.225Q32.7 11.8 33.45 12.5L39.35 9.8L44 18L38.6 21.85Q38.7 22.35 38.725 22.925Q38.75 23.5 38.75 24Q38.75 24.5 38.725 25.05Q38.7 25.6 38.6 26.1L44 30L39.35 38.2L33.45 35.5Q32.65 36.15 31.625 36.775Q30.6 37.4 29.6 37.7L28.6 44ZM24 30.5Q26.7 30.5 28.6 28.6Q30.5 26.7 30.5 24Q30.5 21.3 28.6 19.4Q26.7 17.5 24 17.5Q21.3 17.5 19.4 19.4Q17.5 21.3 17.5 24Q17.5 26.7 19.4 28.6Q21.3 30.5 24 30.5ZM24 27.5Q22.55 27.5 21.525 26.475Q20.5 25.45 20.5 24Q20.5 22.55 21.525 21.525Q22.55 20.5 24 20.5Q25.45 20.5 26.475 21.525Q27.5 22.55 27.5 24Q27.5 25.45 26.475 26.475Q25.45 27.5 24 27.5ZM24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24Q24 24 24 24ZM21.8 41H26.2L26.9 35.4Q28.55 35 30.025 34.15Q31.5 33.3 32.7 32.1L38 34.4L40 30.8L35.3 27.35Q35.5 26.5 35.625 25.675Q35.75 24.85 35.75 24Q35.75 23.15 35.65 22.325Q35.55 21.5 35.3 20.65L40 17.2L38 13.6L32.7 15.9Q31.55 14.6 30.1 13.725Q28.65 12.85 26.9 12.6L26.2 7H21.8L21.1 12.6Q19.4 12.95 17.925 13.8Q16.45 14.65 15.3 15.9L10 13.6L8 17.2L12.7 20.65Q12.5 21.5 12.375 22.325Q12.25 23.15 12.25 24Q12.25 24.85 12.375 25.675Q12.5 26.5 12.7 27.35L8 30.8L10 34.4L15.3 32.1Q16.5 33.3 17.975 34.15Q19.45 35 21.1 35.4Z"
              />
            </svg>
          }
          title={"Easy to edit"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        /> */}
      </div>
    </section>
  );
};

export default FeatureSeller;