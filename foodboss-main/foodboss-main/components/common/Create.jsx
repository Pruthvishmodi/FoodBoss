import Image from "next/image";
import React from "react";

const Creat = ({
  svg = '',
  color = "bg-red-500",
  bColor = "border-red-300",
  title = "title",
  desc = "desc",
}) => {
  return (
    <div className="p-4 flex flex-col items-center w-80">
      <div className="w-20 h-20">
        <Image src={svg} alt={title} width={'100px'} height={'100px'} layout='responsive'/>
      </div>
      <div className="m-4 flex flex-col items-center">
        <h3
          className="text-xl font-semibold py-4"
          style={{ padding: "10px 0" }}
        >
          {title}
        </h3>
        <p className="text-base text-gray-600 text-center">{desc}</p>
      </div>
    </div>
  );
};
export default Creat;
