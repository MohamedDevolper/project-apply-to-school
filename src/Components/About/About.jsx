import one from '../../assets/2019-web.jpg'
import two from '../../assets/2018-web.jpg'
import there from '../../assets/new-campus-2020.jpg'
import four from '../../assets/rowad-2021.jpg'
import Welcom from '../Welcom/Welcom'
export default function About() {
  return (
    <div className='down'>
      <div className="container">
        <h1 className='fw-bolder '>Our History</h1>
        <div className="row mt-5">
          <div className="col-md-3 my-3">
            <div className="contant ">
              <h1 className=''>2020</h1>
              <div className="value">
              <img src={one} className='mt-5 ' width={200} alt="" />
              <p  className='text-muted '>We opened a nursery in Kafr Abdo that follows the American and British Systems
We opened our King Mariout campus</p>
            
              </div>

            </div>
          </div>
          <div className="col-md-3 my-3">
            <div className="contant">
              <h1 className='text-center'>2021</h1>
              <div className="value">
              <img src={two} className='mt-5 ' width={200} alt="" />
              <p  className='text-muted '>We opened a nursery in Wabour El Meyah that follows the American and British Systems.</p>
            
              </div>
            </div>
          </div>
          <div className="col-md-3 my-3">
            <div className="contant">
              <h1 className='text-center'>2022</h1>
              <div className="value">
              <img src={there} className='mt-5 ' width={200} alt="" />
              <p  className='text-muted '>We opened our top-notch campus located on the Ring Road, Abees</p>
            
              </div>
            </div>
          </div>
          <div className="col-md-3 my-3">
            <div className="contant">
              <h1 className='text-center'>2023</h1>
              <div className="value">
              <img src={four} className='mt-5 ' width={200} alt="" />
              <p  className='text-muted '>We added a new campus to our network that delivers IB curriculum</p>
            
              </div>
            </div>
          </div>
        </div>
        <h1 className='text-center history '>History</h1>
      </div>
        <Welcom/>

        <div className="container p-5">
            <div className="annual mt-5">
              <h1 className='text-danger fw-bold'>ANNUAL</h1>
              <p className='fs-3 mb-4'>Report</p>
              <p className='text-muted'>For the academic year 2018/2019 we delivered a strong scholastic performance, achieved our educational targets, and made significant progress with key strategic initiatives and projects.</p>
              <p className='text-muted mt-4'><i class="fa-solid fa-arrow-up-right-from-square text-danger"></i> Explore school programs</p>
              <p className='text-muted'><i class="fa-solid fa-arrow-up-right-from-square text-danger"></i> Coming Soon</p>
          
            </div>
        </div>
    </div>
  )
}
