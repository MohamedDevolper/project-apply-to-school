import React from 'react'
import { Link, NavLink } from 'react-router-dom'
import $ from 'jquery'
import logo from '../../assets/Untitled-1.png'
export default function Navbar() {
  // $(window).scroll(()=>{
  //   //  console.log('sasasa')
  //   let scrollOfset = $('.navbar').offset().top;
  //   if(scrollOfset !== 0){
     
  //     $('.navbar').addClass('nav')

  //   }else{
     
  //     $('.navbar').removeClass('nav')
  //   }
  //   });
  return (
    <div>
      <nav className="navbar fixed-top navbar-expand-lg nav  navbar-light text-white ">
  <div className="container">
    <div className="navbar-brand" >
      <img src={logo} className='w-100' alt="logo school" />
    </div>
    <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span className="navbar-toggler-icon"></span>
    </button>
    <div className="collapse navbar-collapse" id="navbarSupportedContent">
      <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/">Home</NavLink>
        </li>
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/about">ABOUT US</NavLink>
        </li>
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/apply">ACADEMICS</NavLink>
        </li>
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/campus">CAMPUS LIFE</NavLink>
        </li>
  
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/paymat">Register Now</NavLink>
        </li>
        <li className="nav-item mx-2">
          <NavLink className="nav-link " aria-current="page" to="/countact">CONTACT Admission</NavLink>
        </li>

      </ul>

    </div>
  </div>
</nav>
    </div>
  )
}
