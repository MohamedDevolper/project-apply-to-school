import React, { useEffect, useState } from "react";
import camp1 from "../../assets/camp1.jpg";
import camp2 from "../../assets/camp2.jpg";
import camp3 from "../../assets/camp3.jpg";
import camp4 from "../../assets/camp4.jpg";
import camp5 from "../../assets/camp5.jpg";
import camp6 from "../../assets/camp6.png";
import camp7 from "../../assets/camp7.jpg";
import camp8 from "../../assets/camp8.jpg";
import event1 from '../../assets/event1.jpg';
import event2 from '../../assets/event2.jpg';
import event3 from '../../assets/event3.jpg';
export default function Campus() {
  const [scale, setScale] = useState(false);

  useEffect(() => {
    setScale(false);
  }, []);

  const handleButtonClick = () => {
    setScale(true);
  };

  const handleCloseClick = () => {
    setScale(false);
  };

  return (
    <>
      <div className="campus">
        <button onClick={handleButtonClick} className="button">
          Watch Video
        </button>
      </div>
      {scale && (
        <div className="layoutCampus position-absolute vh-100 top-0 bottom-0 start-0 end-0 bg-black bg-opacity-75">
          <p onClick={handleCloseClick} className="close">
            <i className="fa-solid fa-xmark"></i>
          </p>
          <iframe
            width="660"
            height="415"
            src="https://www.youtube.com/embed/SV0uc6BAm6A?si=eFn51Vka1xc2qTn3"
            title="YouTube video player"
            frameBorder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowFullScreen
          ></iframe>
        </div>
      )}

      <div className="aboutSchoole">
        <div className="container containerCampus p-5 gap-5 d-flex flex-column-reverse">
          <div className="row">
            <div className="col-md-4">
              <img src={camp1} className="w-100 rounded-4" alt="" />
            </div>
            <div className="col-md-8">
              <span className="h2">Scouts </span>
              <span className="text-danger h5 ">(9 – 14 years)</span>
              <p className="text-muted my-3">
                Scouts provide children with more confidence, responsibility and
                a sense of independence. It can help develop your child’s social
                skills, encourage self-sufficiency, develop physical and mental
                fitness and give them access to activities and opportunities
                that may have been otherwise unavailable to them.
              </p>
            </div>
          </div>

          <div className="row">
            <div className="col-md-8 text-end">
              <span className="h2">MUN </span>

              <p className="text-muted my-3">
                For the past several years, KLSMUN has been one of the leading
                Model United Nations clubs in Alexandria. We have attended both
                national and international conferences in three different
                continents. Our goal is to create students with the leadership
                qualities that are needed for success in today’s world. We are
                consistently striving to ensure that all students are actively
                participating, as well as actively learning about the issues
                that affect our world. This year, we are launching our very
                first conference that will include four committees: General
                Assembly, Human Rights Council, Disarmament, and Security
                Council.
              </p>
            </div>
            <div className="col-md-4">
              <img src={camp2} className="w-100 rounded-4" alt="" />
            </div>
          </div>

          <div className="row">
            <div className="col-md-4">
              <img src={camp3} className="w-100 rounded-4" alt="" />
            </div>
            <div className="col-md-8">
              <span className="h2">Local and Global Camps </span>
              <span className="text-danger h5 ">(6 – 18 years)</span>
              <p className="text-muted my-3">
                School camps provide our students with the opportunity to form
                relationships through first-hand experiences with trained,
                caring adult role models and experience a sense of achievement
                in a supervised, safe and positive environment as a result. The
                school camp experience sheds light on various soft skills such
                as team building, leadership skills, the ability to overcome
                limitations, and growth in confidence. We organize local camps,
                through our Scouts and WellSpring, and global camps as well.
              </p>
            </div>
          </div>

          <div className="row">
            <div className="col-md-8 text-end">
              <span className="h2">Trips </span>
              <span className="text-danger h5 ">(3-18 years)</span>
              <p className="text-muted my-3">
                “Tell me and I forget; teach me and I may remember; involve me
                and I learn” is a saying we truly value. We understand the
                importance of taking our students out of their classrooms to
                absorb, interact and get involved with the Egyptian community.
                Our trips allow our students to have fun and go back home with
                lessons learned.
              </p>
            </div>
            <div className="col-md-4">
              <img src={camp4} className="w-100 rounded-4" alt="" />
            </div>
          </div>

          <div className="row">
            <div className="col-md-4">
              <img src={camp5} className="w-100 rounded-4" alt="" />
            </div>
            <div className="col-md-8">
              <span className="h2">Engineering For Kids </span>
              <span className="text-danger h5 ">(4 – 14 years)</span>
              <p className="text-muted my-3">
                Engineering for Kids brings Science, Technology, Engineering,
                and Math (STEM), to our KLS students ages 4 to 14, in a fun and
                challenging way, through classes, camps, and workshops. We are
                proud to inspire children to build on their natural curiosity by
                teaching engineering concepts through hands-on learning.
                Engineering is, after all, one of the fastest growing industries
                in the world!
              </p>
            </div>
          </div>

          <div className="row">
            <div className="col-md-8 text-end">
              <span className="h2">Swimming & Fitness Academy </span>
              <span className="text-danger h5 ">(6 – 18 years)</span>
              <p className="text-muted my-3">
              The physical body and cognitive brain development go hand-in-hand. While this continues for life, this relationship is most critical at a young age. When kids are active, their brain develops, allowing for new types of activity. In addition to the physical education in our curriculum, we also have a swimming and fitness academy that caters to all ages.
              </p>
              <span className="text-danger  ">COMING SOON</span>
            </div>
            <div className="col-md-4">
              <img src={camp6} className="w-100 rounded-4" alt="" />
            </div>
          </div>

          <div className="row">
            <div className="col-md-4">
              <img src={camp7} className="w-100 rounded-4" alt="" />
            </div>
            <div className="col-md-8">
              <span className="h2">Skolera </span>
              <span className="text-danger h5 ">(Learning Management Systems)</span>
              <p className="text-muted my-3">
              We use one of the best Learning Management Systems to utilize the latest educational approaches and technology. We aim to channel students’ passion for technology towards a better constructive education. Skolera was created and developed in a real educational environment that made it so sophisticated to look professional and so simple to give the best user experience. It’s genuinely easy, reliable, and attractive.
              </p>
              <button className="btn btn-outline-danger ">Leran More</button>
            </div>
          </div>

          <div className="row">
            <div className="col-md-8 text-end">
              <span className="h2">Student Council </span>
             
              <p className="text-muted my-3">
              The Kaumeya Language Schools Student Council (KLSSC) is a platform where students’ creativity, leadership, and individuality are nurtured and encouraged to grow to new heights. The purpose of the student council is to empower students and give them an opportunity to develop leadership skills by organizing and carrying out school activities and community service projects.  In addition to planning events that contribute to the school’s spirit and core values, the student council is the voice of the student body.  They help share student ideas, interests and concerns with the school community.
              </p>
              
            </div>
            <div className="col-md-4">
              <img src={camp8} className="w-100 rounded-4" alt="" />
            </div>
          </div>
        </div>
      </div>

      <div className="events ">
        <div className="container shadow-lg bg-light text-center p-5">
                <h1 className="text-danger">STAY ALERT</h1>
                <p>with what’s happening</p>
            <div className="row">
                <div className="col-md-4">
                    <div className="contant position-relative text-center ">
                        <img src={event1} className="w-100 rounded-5" alt="" />
                        <p className="showEvents">Events</p>
                        <p className="text-danger mt-4"><i class="fa-regular fa-clock"></i> October 20, 2021</p>
                        <p className=" text-muted fw-bold">Autumn Festival 2021</p>
                    </div>
                </div>
                <div className="col-md-4">
                    <div className="contant position-relative text-center ">
                        <img src={event2} className="w-100 rounded-5" alt="" />
                        <p className="showEvents">Events</p>
                        <p className="text-danger mt-4"><i class="fa-regular fa-clock"></i> October 20, 2021</p>
                        <p className=" text-muted fw-bold">Night Camp – Space</p>
                    </div>
                </div>
                <div className="col-md-4">
                    <div className="contant position-relative text-center ">
                        <img src={event3} className="w-100 rounded-5" alt="" />
                        <p className="showEvents">Events</p>
                        <p className="text-danger mt-4"><i class="fa-regular fa-clock"></i> Novmabr 20, 2021</p>
                        <p className=" text-muted fw-bold">Costume Party 2021 </p>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </>
  );
}
