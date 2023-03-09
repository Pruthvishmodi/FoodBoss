import React from 'react'
import { FaFacebook, FaInstagram, FaLinkedin, FaSkype, FaTwitter, FaInstagramSquare, FaPinterest } from 'react-icons/fa'
import { AiFillInstagram } from 'react-icons/ai'
import Link from 'next/link'
import { IoLocationSharp } from 'react-icons/io5'
import { MdCall, MdEmail } from 'react-icons/md'

function FooterRider() {
    return (
        <footer className='footer'>
            <div className='wrapper-footer'>
                <div className='upper-footer'>
                    <div className='social-media'>
                        {/* <h2>Office Hours</h2> */}
                        <Link href="/"><img src='/foodboss-logo-dummy.png' width={200}></img></Link>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, a! Cum illum ipsum, sapiente distinctio vero animi officiis nemo? Harum.</p>
                        <div className="social">

                            <a href='/' target='_blank'><FaFacebook size='1.5rem'></FaFacebook></a>
                            <a href='' target='_blank'><FaTwitter size='1.5rem'></FaTwitter></a>
                            <a href='' target='_blank'><FaSkype size='1.6rem'></FaSkype></a>
                            <a href='' target='_blank'><FaLinkedin size='1.5rem'></FaLinkedin></a>
                            <a href='' target='_blank'><FaInstagramSquare size='1.5rem' /></a>
                            <a href='' target='_blank'><FaPinterest size='1.5rem' /></a>
                        </div>
                    </div>
                    <div className='footer-nav'>
                        <h2>Quick Links</h2>
                        <div className="wrapper-link">
                            {/* <Link href='/'><p>Home</p></Link> */}
                            <Link href='/'><p>About Us</p></Link>
                            {/* <Link href='/services/1'><p>Services</p></Link> */}
                            {/* <Link href='/blogs'><p>Blogs</p></Link> */}
                            {/* <Link href='/books'><p>Books</p></Link> */}
                            {/* <Link href='/contact'><p>Contact Us</p></Link> */}
                            <Link href='/'><p>Privacy Policy</p></Link>
                            <Link href='/'><p>Terms</p></Link>
                        </div>
                    </div>
                    <div className='footer-nav'>
                        <h2>Resources</h2>
                        <div className="wrapper-link">
                            {/* <Link href='/'><p>Home</p></Link> */}
                            <Link href='/'><p>Customer</p></Link>
                            <Link href='/'><p>Rider</p></Link>
                            {/* <Link href='/blogs'><p>Blogs</p></Link> */}
                            {/* <Link href='/books'><p>Books</p></Link> */}
                            <Link href='/'><p>Career</p></Link>
                        </div>
                    </div>
                    <div className='footer-nav second-footer'>
                        <h2>Contact Us</h2>
                        <a href='' target='_blank'><p><IoLocationSharp size="1.5rem"></IoLocationSharp><span>Ganesh Glory 11, Ahmedabad</span></p></a>
                        <a href='' target='_blank'><p><MdCall size="1.5rem"></MdCall><span>(+91) 9438353853</span></p></a>
                        <a href='' target='_blank'><p><MdEmail size="1.5rem"></MdEmail><span>support@foodboss.in</span></p></a>

                    </div>
                    {/* <div className='social-media'>
                <h2>Office Hours</h2>
                    
                <p><span className='days-footer'>Monday:</span> <span>9:00 am EST – 6:00 pm EST</span></p>
                        <p><span className='days-footer'>Tuesday:</span> <span>9:00 am EST – 6:00 pm EST</span></p>
                        <p><span className='days-footer'>Wednesday:</span> <span>9:00 am EST – 6:00 pm EST</span></p>
                        <p><span className='days-footer'>Thursday:</span> <span>9:00 am EST – 6:00 pm EST</span></p>
                        <p><span className='days-footer'>Friday:</span> <span>9:00 am EST – 6:00 pm EST</span></p>
                        </div> */}

                </div>
                <hr />
                <div className='floating-footer'>
                    <h2>All Rights Reserved By © Food Boss, LLC 2020-2022.</h2>

                </div>
            </div>
        </footer>
    )
}

export default FooterRider