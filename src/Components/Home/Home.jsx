import Education from '../Education/Education'
import Gradute from '../Gradute/Gradute'
import Videos from '../Videos/Videos'
import Story from '../Story/Story'
import styles from './Home.module.css'
import Slidr from '../Slider/Slider'
export default function Home() {
  return (
    <main>

   
    <div className={styles.main}>
    <div className={`${styles.layout} d-flex justify-content-center align-items-center`}>
      <div className="content">
        <h1 className='text-uppercase text-home-title'>kls has a new home</h1>
        <h3 className='text-uppercase text-home-desc'>new campus premise is <span className='text-danger'>open</span></h3>
        <button className='btn text-home-button text-uppercase'>read more</button>
      </div>
    </div>
    </div>

    <Education />
    <Gradute/>
    <Slidr/>
    <Videos/>
    <Story/>
    </main>
  )
}
