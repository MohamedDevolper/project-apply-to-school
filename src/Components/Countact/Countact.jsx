import styles from "./Countact.module.css";
export default function Countact() {
  return (
    <>
      <div className="map">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13802.667099964212!2d31.302589649999994!3d30.132347299999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sar!2seg!4v1699876960570!5m2!1sar!2seg"
          width="100%"
          height="600"
          style={{ border: "0" }}
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
      <div className="subscrib d-flex justify-content-center align-items-center flex-column">
        <h1 className="text-white">SUBSCRIBE TO KLS NEWSLETTER</h1>
        <div className="input-group  mb-3">
          <input
            type="email"
            className="form-control  bg-black p-2"
            placeholder="enter your email..."
            aria-label="Recipient's username"
            aria-describedby="basic-addon2"
          />
          <span
            class="input-group-text  border-0 p-2 text-white"
            id="basic-addon2"
          >
            SUBSCRIBE
          </span>
        </div>
      </div>

      <div className="form p-5">
        <div className="container text-center p-5">
          <h1 className="text-danger fw-bold">WANT TO GET IN TOUCH?</h1>
          <p className="fs-5 fw-bold ">We'd love to hear from you.</p>
          <div className="row p-3 ">
            <div className="col-md-6 my-3">
              <input type="text" className="form-control" placeholder="Name" />
            </div>
            <div className="col-md-6 my-3">
              <input
                type="text"
                className="form-control"
                placeholder="Your e-mail"
              />
            </div>

            <div className="col-md-6 my-3">
              <input type="tel" className="form-control" placeholder="Phone" />
            </div>
            <div className="col-md-6 my-3">
              <select class="form-select" >
                <option selected>Reason</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
              </select>
            </div>
            <div className="col-md-12 my-3">
              <textarea  className="form-control" placeholder="Message" ></textarea>
            </div>
            <button >Supmit</button>
          </div>
        </div>
      </div>
    </>
  );
}
