import React from "react";

const Card = ({
  svg = null,
  color = "bg-red-500",
  // bColor = "border-red-300",
  title = "title",
  desc = "desc",
}) => {
  return (
    <div className="circles w-full lg:w-72">
      <div className="py-8 flex flex-col items-center bg-white shadow-lg rounded-3xl">
        <div
          className={`rounded-full h-24 w-24`}>
          {svg}
        </div>
        <div className="heading m-3 flex flex-col items-center">
          <h3
            className="text-xl font-semibold m-4 text-center"
            style={{ padding: "10px 0" }}>
            {title}
          </h3>
          <p className="text-base text-gray-600 text-center">{desc}</p>
        </div>
      </div>
    </div>
  );
};

export default Card;
