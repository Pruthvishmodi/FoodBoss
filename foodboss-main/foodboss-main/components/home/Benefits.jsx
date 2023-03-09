import React from "react";
import Creat from "../common/Create";

const Benefits = ({data}) => {
  return (
    <section className="row flex flex-row items-center justify-center p-20">
      <div className="flex flex-col lg:flex-row items-center justify-center p-8">
        {
          data?.data?.map((e,i)=>
          <Creat
          svg={e?.attributes?.icon?.data?.attributes?.url}
          title={e?.attributes?.title}
          desc={e?.attributes?.description}
          key={i}
        />)
        }
        
        {/* <Creat
          color="bg-blue-500"
          svg={
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
              <path
                className="fill-orange-500"
                d="M13.05 36Q11.85 36 10.925 35.1Q10 34.2 10 33V14.45H13V33Q13 33 13 33Q13 33 13 33H35.65V36ZM19 30Q17.8 30 16.9 29.1Q16 28.2 16 27V9Q16 7.8 16.9 6.9Q17.8 6 19 6H41Q42.2 6 43.1 6.9Q44 7.8 44 9V27Q44 28.2 43.1 29.1Q42.2 30 41 30ZM19 27H41Q41 27 41 27Q41 27 41 27V12.1H19V27Q19 27 19 27Q19 27 19 27ZM7 42Q5.8 42 4.9 41.1Q4 40.2 4 39V20.45H7V39Q7 39 7 39Q7 39 7 39H29.6V42Z"
              />
            </svg>
          }
          title={"Well Documented"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        />
        <Creat
          color="bg-orange-500"
          svg={
            <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
              {" "}
              <path
                className="fill-orange-500 "
                d="M20.25 28H36V25H23.25ZM12 28H15.95L28.55 15.55Q28.85 15.25 28.85 14.8Q28.85 14.35 28.55 14.05L25.8 11.55Q25.55 11.3 25.175 11.3Q24.8 11.3 24.55 11.55L12 24.3ZM4 44V7Q4 5.85 4.9 4.925Q5.8 4 7 4H41Q42.15 4 43.075 4.925Q44 5.85 44 7V33Q44 34.15 43.075 35.075Q42.15 36 41 36H12ZM7 36.75 10.75 33H41Q41 33 41 33Q41 33 41 33V7Q41 7 41 7Q41 7 41 7H7Q7 7 7 7Q7 7 7 7ZM7 7Q7 7 7 7Q7 7 7 7Q7 7 7 7Q7 7 7 7V33Q7 33 7 33Q7 33 7 33V36.75Z"
              />
            </svg>
          }
          title={"Clean Design"}
          desc={"Lorem ipsum is are many variations of pass majy."}
        /> */}
      </div>
    </section>
      );
    };
    
    export default Benefits;