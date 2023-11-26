import { NavLink } from "react-router-dom";
import about1 from "../../assets/About-Us-Mission.jpg";
import about2 from "../../assets/about2.jpg";
import about3 from "../../assets/about3.jpg";

import { useEffect, useState } from "react";
import Slider from "react-slick";
export default function Welcom() {
    var settings = {
    
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay:true
    };

  return (
    <div className="p-5 welcome">
      <h1 className="fw-bolder mb-5">Welcome to Kaumeya</h1>
      <div className="row">
        <div className="col-md-6">
        <Slider {...settings} className="w-100 mx-auto curusor">
      <div>
        <img src={about1} className="w-100 rounded-3"  alt="slide" />
      </div>
      <div>
        <img src={about2} className="w-100 rounded-3"  alt="slide" />
      </div>
      <div>
        <img src={about3} className="w-100 rounded-3"  alt="slide" />
      </div>



    </Slider>
        </div>
        <div className="col-md-6">
          <div className="links">
          
            <ul
              className="nav bg-transparent mb-3"
              id="pills-tab"
              role="tablist"
            >
              <li className="nav-item" role="presentation">
                <button
                  className="nav-link  mx-2  fs-4 text-muted  active"
                  id="pills-home-tab"
                  data-bs-toggle="pill"
                  data-bs-target="#pills-home"
                  type="button"
                  role="tab"
                  aria-controls="pills-home"
                  aria-selected="true"
                >
                  MISSION
                </button>
              </li>
              <span className={"fs-2 mx-2"}>-</span>
              <li className="nav-item" role="presentation">
                <button
                  className="nav-link  mx-2 fs-4  text-muted "
                  id="pills-profile-tab"
                  data-bs-toggle="pill"
                  data-bs-target="#pills-profile"
                  type="button"
                  role="tab"
                  aria-controls="pills-profile"
                  aria-selected="false"
                >
                  VISION
                </button>
              </li>
              <span className={"fs-2 mx-2"}>-</span>
              <li className="nav-item" role="presentation">
                <button
                  className="nav-link mx-2 fs-4  text-muted "
                  id="pills-contact-tab"
                  data-bs-toggle="pill"
                  data-bs-target="#pills-contact"
                  type="button"
                  role="tab"
                  aria-controls="pills-contact"
                  aria-selected="false"
                >
                  CORE VALUES
                </button>
              </li>
            </ul>
            <div className="tab-content" id="pills-tabContent">
              <div
                className="tab-pane fade show active text"
                id="pills-home"
                role="tabpanel"
                aria-labelledby="pills-home-tab"
                tabindex="0"
          
              >
                Our mission is to provide our students with an excellent quality
                education in a safe and supportive environment that promotes
                character-building, inspiration and motivation to excel. We
                strive towards assisting our students to develop the skills
                needed to become responsible and productive members of the local
                and global community
              </div>
              <div
                className="tab-pane fade text"
                id="pills-profile"
                role="tabpanel"
                aria-labelledby="pills-profile-tab"
                tabindex="0"
              >
                Our vision is to empower our students to learn valuable
                knowledge and skills that will guide them as life-long learners
                and become confident leaders who aspire to achieve their full
                potential.
              </div>
              <div
                className="tab-pane fade text"
                id="pills-contact"
                role="tabpanel"
                aria-labelledby="pills-contact-tab"
                tabindex="0"
              >
                At KLS we prepare our students for their future by embracing our
                five core values: compassion, diversity, honour, respect and
                wisdom. All students and staff members, in partnership with
                parents and families are encouraged to live by these set of core
                values and to reflect them in their daily lives. Compassion: To
                act with care, acceptance, and understanding towards others
                Diversity: to expand our thinking and unite for a common cause
                Honour: to lead with integrity and truthfulness Respect: to
                practice tolerance and appreciation for different opinions of
                all members of the school community Wisdom: to constantly seek
                knowledge and intelligence for enlightened decision making
              </div>
              <div
                className="tab-pane fade"
                id="pills-disabled"
                role="tabpanel"
                aria-labelledby="pills-disabled-tab"
                tabindex="0"
              >
                ...
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
