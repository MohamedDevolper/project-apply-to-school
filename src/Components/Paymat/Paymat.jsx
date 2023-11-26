import React from 'react'
import axios from "axios";
import  { useState } from "react";
import toast from "react-hot-toast";

export default function Topay() {
  const [studentName, setStudentName] = useState("");
  const [studentGender, setStudentGender] = useState("");
  const [stydentGuardianNumber, setStydentGuardianNumber] = useState("");
  const [studentGrada, setStudentGrada] = useState("");
  const [studentDate, setStudentDate] = useState("");
  const [email, setEmail] = useState("");

  const handlSupmit = () => {
    if (studentName.length === 0) {
      toast.error("Student Name is required!!?");
    } else if (studentGender.length === 0) {
      toast.error("Student Gender is required!!?");
    } else if (stydentGuardianNumber.length === 0) {
      toast.error("Phone is required!!?");
    } else if (studentGrada.length === 0) {
      toast.error("Student Grada is required!!?");
    } else if (studentDate.length === 0) {
      toast.error("Student Date is required!!?");
    } else if (email.length === 0) {
      toast.error("Email is required!!?");
    } else {
      const url = "http://localhost/php/handel.php";

      let fData = new FormData();
      fData.append("studentName", studentName);
      fData.append("studentGender", studentGender);
      fData.append("studentGuardianNumber", stydentGuardianNumber);
      fData.append("studentGrada", studentGrada);
      fData.append("studentDate", studentDate);
      fData.append("email", email);

      axios
        .post(url, fData)
        .then((res) => res)
        .catch((err) =>
          toast.success("Data saved successfully, we will contact you soon✔")
        );
    }
  };

  return (
    <div className="down">
      <form className="w-75 mx-auto p-5 color-form shadow-lg rounded-5  ">
        <h1 className="text-color">Apply at school</h1>
        <p className="  d-flex align-items-center fw-bold">
          To register, fill out the form, please{" "}
          <i className="fa-solid fa-arrow-down ms-2"></i>.
        </p>

        <div className="row p-3 ">
          <div className="col-md-6 my-3">
            <label className="fw-bold my-2" htmlFor="name">
              Student Name :
            </label>
            <input
              id="name"
              name="studentName"
              type="text"
              className="form-control"
              placeholder="enter your student name"
              value={studentName}
              onChange={(e) => {
                setStudentName(e.target.value);
              }}
            />
          </div>
          <div className="col-md-6 my-3">
            <label className="fw-bold my-2" htmlFor="Gender">
              Gender :
            </label>
            <select
              id="Gender"
              name="studentGender"
              className="form-select"
              value={studentGender}
              onChange={(e) => {
                setStudentGender(e.target.value);
              }}
            >
              <option selected>Gender</option>
              <option value="1">Male</option>
              <option value="2">Female</option>
            </select>
          </div>

          <div className="col-md-6 my-3">
            <label className="fw-bold my-2" htmlFor="phone">
              Student Guardian Number :
            </label>
            <input
              id="phone"
              name="studentGuardianNumber"
              type="number"
              className="form-control"
              placeholder="enter phone..."
              value={stydentGuardianNumber}
              onChange={(e) => {
                setStydentGuardianNumber(e.target.value);
              }}
            />
          </div>
          <div className="col-md-6 my-3">
            <label className="fw-bold my-2" htmlFor="degree">
              Student Grade :
            </label>
            <input
              id="degree"
              name="studentGrada"
              type="tel"
              className="form-control"
              placeholder="student grade..."
              value={studentGrada}
              onChange={(e) => {
                setStudentGrada(e.target.value);
              }}
            />
          </div>
          <div className="col-md-6 my-3">
            <label className="fw-bold my-2" htmlFor="date">
              Student Date :
            </label>
            <input
              id="date"
              name="studentDate"
              type="date"
              className="form-control"
              placeholder="Phone"
              value={studentDate}
              onChange={(e) => {
                setStudentDate(e.target.value);
              }}
            />
          </div>
          <div className="col-md-6 my-3">
            <label htmlFor="email" className="fw-bold my-2">
              Email Guardian :
            </label>
            <input
              id="email"
              name="email"
              type="email"
              className="form-control"
              placeholder="enter email..."
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
              }}
            />
          </div>

          <div className="col-md-12 my-3">
            <textarea className="form-control" placeholder="Message"></textarea>
          </div>

          <button
            type="button"
            onClick={() => handlSupmit()}
            className=" w-100 mx-auto btn btn-supmit"
          >
            Send Data
          </button>
        </div>
      </form>
    </div>
  );
}

