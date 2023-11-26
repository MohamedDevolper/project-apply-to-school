import Slider from "react-slick";
import slide1 from '../../assets/new-campus-2020.jpg'
import slide2 from '../../assets/rowad-2021.jpg'
import slide3 from '../../assets/2018-web.jpg'
import slide4 from '../../assets/2019-web.jpg'

// import Slider from 'react-slick'
export default function Slidr() {
  var settings = {
      dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay:true
  };
  return (
    <div className="p-4 container mt-4  ">
            <Slider {...settings} className="w-100 mx-auto curusor">
      <div>
        <img src={slide1} className="w-100" height={400} alt="slide" />
      </div>
      <div>
        <img src={slide2} className="w-100" height={400} alt="slide" />
      </div>
      <div>
        <img src={slide3} className="w-100" height={400} alt="slide" />
      </div>
      <div>
        <img src={slide4} className="w-100" height={400} alt="slide" />
      </div>


    </Slider>
    </div>
  )
}
