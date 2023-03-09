import React from 'react'
import {BsFillTelephoneFill} from 'react-icons/bs'
import {GrMail} from 'react-icons/gr'

const UserSupport = () => {
  return (
    <div className='contact-wrapper h-screen'>
        <div className="contact-heading flex justify-center flex-col items-center pt-44 lg:pb-16 lg:pt-64">
            <h1 className='text-4xl font-bold text-white'>We're here to help.</h1>
            <p className='text-lg pt-4 px-4 text-center text-white'>Have an issue with an order or feedback for us? Our support team is here to help you 7am - 2am.</p>
        </div>
        <div className='contact-content-wrapper pt-12 flex flex-col lg:flex-row justify-center gap-8 lg:gap-8'>
            <div className="contact-content px-8 flex flex-col gap-6 w-96">
                <div className='contact-icon-name flex flex-row items-center gap-4'>
                    <BsFillTelephoneFill fill='#F77B54' size={30}/>
                    <h2 className='text-2xl font-bold text-white'>Phone</h2>
                </div>
                <div><hr className='contact-line w-5/6 lg:w-88 border-[#F77B54]'/></div>
                <div className="contact-para">
                    <p className='text-lg text-white'>Call +91 1234567890 to speak to a support representative now.</p>
                </div>
            </div>
            <div className="contact-content px-8 flex flex-col gap-6 w-96">
                <div className='contact-icon-name flex flex-row items-center gap-4'>
                    <GrMail fill='#F77B54' size={30}/>
                    <h2 className='text-2xl font-bold text-white'>Email</h2>
                </div>
                <div><hr className='contact-line w-5/6 lg:w-88 border-[#F77B54]'/></div>
                <div className="contact-para">
                    <p className='text-lg text-white'>Send us an email to support@foodboss.in for your query.</p>
                </div>
            </div>
        </div>
    </div>
  )
}

export default UserSupport