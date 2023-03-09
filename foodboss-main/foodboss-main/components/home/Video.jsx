import React, { useState } from "react";

const Video = ({data}) => {
  const [isOPen, setIsOPen] = useState(false);
  console.log('sss',data?.videos?.data[0]?.attributes?.url);
  const btnClick = () => {
    setIsOPen((prev) => !prev);
  };

  return (
    <section className="videos relative flex w-full items-center justify-center my-8">
      {/* <h2 className="absolute  text-6xl flex items-center justify-center w-4/5 h-4/5 text-black z-30">
        Watch Our Video
      </h2> */}
      <div className="icon absolute flex z-40 ">
        <div className="rounded-full w-20 h-20">
          {/* <div className="circle z-30 absolute rounded-full bg-transparent border-sky-50 border-2 h-16 w-16 p-3"></div>
          <div className="circle z-30 absolute rounded-full bg-transparent border-sky-50 border-2 h-16 w-16 p-3"></div>
          <div className="circle z-30 absolute rounded-full bg-transparent border-sky-50 border-2 h-20 w-20 p-3 -m-2"></div> */}
          <button
            className="btn z-40 absolute hover:bg-black rounded-full bg-white p-4"
            onClick={() => btnClick()}
          >
            <svg xmlns="http://www.w3.org/2000/svg" height="50" width="50">
              <path
                className="fill-black hover:fill-white"
                d="M16 37.85V9.85L38 23.85ZM19 23.85ZM19 32.4 32.45 23.85 19 15.3Z"
              />
            </svg>
          </button>
        </div>
      </div>
      <img
        className="video-thumbnail z-20 lg:rounded-3xl rounded-2xl lg:w-3/5 w-[80%]  h-auto border-2"
        src={`${data?.data[0]?.attributes?.image?.data?.attributes?.url}`}
        type="image/png"
      />
      {isOPen ? (
        <div className={`${isOPen ? "block" : "hidden"} w-2/3 absolute z-50`}>
          <button
            className="absolute -top-12 -right-4 fill-white"
            onClick={() => {
              btnClick();
            }}
          >
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48" fill="black">
              <path d="M12.45 37.65 10.35 35.55 21.9 24 10.35 12.45 12.45 10.35 24 21.9 35.55 10.35 37.65 12.45 26.1 24 37.65 35.55 35.55 37.65 24 26.1Z" />
            </svg>
          </button>
          <iframe
            className="lg:w-3/4 lg:h-[32rem] h-48 mx-auto my-0"
            src={data?.data[0]?.attributes?.url}
            width=""
            height=""
            allowFullScreen
            frameborder="0"
          ></iframe>
        </div>
      ) : null}
    </section>
  );
};

export default Video;