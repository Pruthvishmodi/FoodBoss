import React from 'react'
import styled from 'styled-components';


const ScrollBarComp = styled.div`
  animation: scrollItem 10s linear infinite;
  display: flex;
  flex-direction: row;
  width: calc(350px * ${props=>props.length});
  gap: 4rem;

  @keyframes scrollItem {
    0% {
      transform: translateX(0);
   }
    100% {
      transform: translateX(calc(-350px * ${props=>props.length}));
   }
  }
`;


const CitySlider = ({data={}}) => {
  console.log(data?.cities, "data of city");
  return (
      <div className="city-body">
    <div className="citySlider">
      <ScrollBarComp length={data?.cities?.data?.length}>
	{/* <div className="slide-track flex flex-row gap-16"> */}
        {
          data?.cities?.data?.map((e,i)=>  <div className="citySlide">
      <div className="city-wrapper w-auto overflow-x-hidden flex gap-5 items-center">
        <img src={e?.attributes?.cityIcon?.data[0]?.attributes?.url} alt="" className='h-10 w-10'/>
			  <h1 className='text-5xl leading-[4rem]'>{e?.attributes?.city}</h1>
      </div>
		</div>)
        }
        </ScrollBarComp>
	{/* </div> */}
</div>
</div>
  )
}

export default CitySlider;