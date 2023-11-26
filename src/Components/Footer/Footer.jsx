import logo from '../../assets/Logo (1).png'
export default function Footer() {
  return (
    <footer>
      <div className="upBar    mt-4 p-2">
          <ul className='d-flex container justify-content-between align-items-center my-auto '>
            <li>Home</li>
            <li>About</li>
            <li>Apply</li>
            <li>Paymat</li>
            <li>Contact</li>
          </ul>
      </div>
      <div className="bottomBar  ">
        <div className="d-flex justify-content-center align-items-center ">
          <img src={logo}  alt="logo" />
        </div>
        <div className="container">

        <div className="row mt-4">
          <div className="col-md-4">
          <button className=' w-100   aria-hidden="true"></i> p-2  btn text-home-button'>Phone</button>
          </div>
          <div className="col-md-4">
          <button className=' w-100  p-2 mb-4 btn text-home-button'>Email</button>
          <button className=' w-100  p-2 btn text-home-button'>Location</button>
          </div>
          <div className="col-md-4">
          <div className="line bg-white "></div>
          <div className="row align-items-center">
            <div className="col-md-8 text-white mt-2">2019 © The App Concept - All Rights Reserved</div>
            <div className="col-md-4 icons d-flex">
            <div title='instegram' className="icon  "><i class="fa-brands fa-instagram fx-2 "></i></div>
            <div  title='facebook' className="icon  "><i class="fa-brands fa-facebook fx-2"></i></div>
          </div>
          </div>
      
          </div>
        </div>
        </div>
      </div>
    </footer>
  )
}
