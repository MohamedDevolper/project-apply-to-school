import storyImage from '../../assets/The-Story-1.jpeg'
export default function Story() {
  return (
    <div className='container p-3 mt-5'>
        <div className="row">
            <div className="col-md-6">
                <h1 className='text-danger'>THE STORY</h1>
                <h4 className='text-muted mb-4'>of Our KLS Family</h4>
                <p className='prag'>Kaumeya Language School is proud of its deep-rooted history and heritage in the Alexandrian community. We were one of the first private schools in Alexandria to welcome students.</p>
                <p className='prag'>As our school grew in the 1980s, so did the demand from parents for international education. Today KLS offers a diverse learning program with four different educational departments: National, American, British, and International Baccalaureate Department.</p>
                <p className='text-muted'><i class="fa-solid fa-arrow-up-right-from-square text-danger"></i> Our History</p>
                <p className='text-muted'><i class="fa-solid fa-arrow-up-right-from-square text-danger"></i> Explore school programs</p>
          
            </div>
            <div className="col-md-6">
                <img src={storyImage} className='w-100 rounded-5' alt="story" />
            </div>
        </div>
    </div>
  )
}
