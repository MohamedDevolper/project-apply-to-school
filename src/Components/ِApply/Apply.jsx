import dimy1 from '../../assets/dimy1.png'
import dimy2 from '../../assets/dimy2.png'
import dimy3 from '../../assets/dimy3.png'
import dimy4 from '../../assets/dimy4.png'
import image from '../../assets/new-campus-2020.jpg'
import image2 from '../../assets/image2.jpg'
import image3 from '../../assets/image3.jpg'
import image5 from '../../assets/image5.jpg'
import image6 from '../../assets/image6.jpg'
import image7 from '../../assets/image7.jpg'
import Slider from 'react-slick'

export default function Apply() {
  var settings = {
    dots: true,
  infinite: true,
  speed: 500,
  slidesToShow: 1,
  slidesToScroll: 1,
  autoplay:true
};
  return (
    <section>

    <div className=' acadimic d-flex align-items-center'>
      <div className="contaent container">
          <p className='fs-1 p-0 m-0 text-white'>PROMISING</p>
          <h1 className='fw-bolder quality p-0 p-0 text-white '>QUALITY EDUCATION</h1>
      </div>
    </div>

    <div className="container p-5">
      <div className="row ">
        <div className="hav col-md-3 p-5">
          <div className="contaent p-3">
            <h2 className='fw-bold fs-4' >Nursery
              <br />Department</h2>
              <h2 className=' years fs-3 fw-bold position-relative '>3-6</h2>
              <h2><i class="fa-solid fa-arrow-right"></i></h2>
          </div>
        </div>
        <div className="hav col-md-3 p-5">
          <div className="contaent p-3">
            <h2 className='fw-bold fs-4' >National
                <br />Department</h2>
              <h2 className=' years fs-3 fw-bold position-relative '>4-6</h2>
              <h2><i class="fa-solid fa-arrow-right"></i></h2>
          </div>
        </div>
        <div className="hav col-md-3 p-5">
          <div className="contaent p-3">
            <h2 className='fw-bold fs-4' >American
              <br />Department</h2>
              <h2 className=' years fs-3 fw-bold position-relative '>6-8</h2>
              <h2><i class="fa-solid fa-arrow-right"></i></h2>
          </div>
        </div>
        <div className="hav col-md-3 p-5">
          <div className="contaent p-3">
            <h2 className='fw-bold fs-4' >British
                <br />Department</h2>
              <h2 className=' years fs-3 fw-bold position-relative '>3-9</h2>
              <h2><i class="fa-solid fa-arrow-right"></i></h2>
          </div>
        </div>

      </div>
    </div>

    <div className="Special">
      <h1 >WHAT MAKES OUR</h1>
      <p className='fs-3 mb-4'>School Special</p>
      <div className="row">
        <div className="col-md-3">
          <div className="content">
          <img src={dimy1} width={50} className='mb-4' alt="" />
          <p className='my-2'>Transparency</p>
          <p style={{lineHeight:'16px' ,whiteSpace:'1px'}}>we constantly communicate clearly and efficiently with all the school’s stakeholders.</p>
          </div>
        </div>
        <div className="col-md-3">
          <div className="content">
          <img src={dimy2} width={50} className='mb-4' alt="" />
          <p className='my-2'>Fun</p>
          <p style={{lineHeight:'16px' ,whiteSpace:'1px'}}>we make sure our children are having fun on their educational journey.</p>
          </div>
        </div>
        <div className="col-md-3">
          <div className="content">
          <img src={dimy3} width={50} className='mb-4' alt="" />
          <p className='my-2'>Quality Education</p>
          <p style={{lineHeight:'16px' ,whiteSpace:'1px'}}>we provide 3 different curriculums and selectively appointed the best staff for each.</p>
          </div>
        </div>
        <div className="col-md-3">
          <div className="content">
          <img src={dimy4} width={50} className='mb-4' alt="" />
          <p className='my-2'>Transparency</p>
          <p style={{lineHeight:'16px' ,whiteSpace:'1px'}}>we constantly communicate clearly and efficiently with all the school’s stakeholders.</p>
          </div>
        </div>
      </div>
    </div>

    <div className="find p-5">
      <h1 className='text-danger fw-bold'>WHERE TO FIND US</h1>
      <div className="container">
        <div className="row p-4">
          <div className="col-md-4">
            
           <div className="d-flex flex-column  colum gap-4 ">
           <p className='fs-4 text-muted fw-bold'>Abis Campus</p>
            <p className='fs-4 text-muted fw-bold'>KLS - Al Rowad Campus</p>
            <p className='fs-4 text-muted fw-bold'>King Mariout Campus</p>
            <p className='fs-4 text-muted fw-bold'>Sultan Hussien Campus</p>
           </div>
          </div>
          <div className="col-md-8">
          <Slider {...settings} className="w-100 mx-auto curusor">
      <div>
      <img src={image} className='w-100 rounded-3' height={400} alt="" />
      </div>
      <div>
      <img src={image5} className='w-100 rounded-3'height={400} alt="" />
      </div>
      <div>
      <img src={image2} className='w-100 rounded-3'height={400} alt="" />
      </div>
      <div>
      <img src={image3} className='w-100 rounded-3'height={400} alt="" />
      </div>

    </Slider>
    
          </div>
        </div>
      </div>
    </div>
    </section>
  )
}
