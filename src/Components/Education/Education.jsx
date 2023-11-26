import React from 'react'
import edu1 from '../../assets/s2/Cognia_ACCRED-BadgeAmerican-1-155x155.png'
import edu2 from '../../assets/s2/IB-min-155x155.png'
import edu3 from '../../assets/s2/MoE-200x200.png'
import edu4 from '../../assets/s2/Oxford-200x200.png'
import edu5 from '../../assets/s2/Pearson-200x200.png'
import edu6 from '../../assets/s2/Untitled-2.png'

export default function Education() {
  return (
    <div className='container p-5 position-relative'>
        <h1 className='test'>Quality Education</h1>
        <div className="row align-items-center">
            <div className="col-md-2">
                <img src={edu1} className='w-100' alt="education" />
            </div>
            <div className="col-md-2">
                <img src={edu2} className='w-100' alt="education" />
            </div>
            <div className="col-md-2">
                <img src={edu3} className='w-100' alt="education" />
            </div>
            <div className="col-md-2">
                <img src={edu4} className='w-100' alt="education" />
            </div>
            <div className="col-md-2">
                <img src={edu5} className='w-100' alt="education" />
            </div>
            <div className="col-md-2">
                <img src={edu6} className='w-100' alt="education" />
            </div>
        </div>
    </div>
  )
}
