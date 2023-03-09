import React from 'react'
import { FaFacebook, FaInstagram, FaLinkedin, FaSkype, FaTwitter, FaInstagramSquare, FaPinterest, FaYoutube } from 'react-icons/fa'
import { AiFillInstagram } from 'react-icons/ai'
import Link from 'next/link'
import { IoLocationSharp } from 'react-icons/io5'
import { MdCall, MdEmail } from 'react-icons/md'

function FooterHome() {
    return (
        <footer className='footer'>
            <div className='wrapper-footer'>
                <div className='upper-footer'>
                    <div className='social-media'>
                        {/* <h2>Office Hours</h2> */}
                        <Link href="/"><img src='/foodboss-original-logo.png' width={200}></img></Link>
                        <p>Foodboss, proudly made in INDIA, is an online E-grocery platform enabling local sellers and vendors deliver groceries to their neighbourhood customers.  </p>
                        <div className="social">

                            <a href='https://www.facebook.com/foodbossIN' target='_blank'><FaFacebook size='1.5rem'></FaFacebook></a>
                            <a href='https://twitter.com/FoodbossIN' target='_blank'><FaTwitter size='1.5rem'></FaTwitter></a>
                            {/* <a href='' target='_blank'><FaSkype size='1.6rem'></FaSkype></a> */}
                            <a href='https://www.linkedin.com/company/foodboss-retail-private-limited/' target='_blank'><FaLinkedin size='1.5rem'></FaLinkedin></a>
                            <a href='https://www.youtube.com/channel/UC6Uq9bQODhBd1hoBWtyOX0w' target='_blank'><FaYoutube size='1.5rem'></FaYoutube></a>
                            <a href='https://instagram.com/foodboss_in?igshid=YmMyMTA2M2Y=' target='_blank'><FaInstagramSquare size='1.5rem' /></a>
                            {/* <a href='' target='_blank'><FaPinterest size='1.5rem' /></a> */}
                        </div>
                    </div>
                    <div className='footer-nav'>
                        <h2>Quick Links</h2>
                        <div className="wrapper-link">
                            {/* <Link href='/'><p>Home</p></Link> */}
                            <Link href='/about'><p>About Us</p></Link>
                            {/* <Link href='/services/1'><p>Services</p></Link> */}
                            {/* <Link href='/blogs'><p>Blogs</p></Link> */}
                            {/* <Link href='/books'><p>Books</p></Link> */}
                            {/* <Link href='/contact'><p>Contact Us</p></Link> */}
                            <Link href='/policies/privacy-policy'><p>Privacy Policy</p></Link>
                            <Link href='/policies/terms'><p>Terms</p></Link>
                            <Link href='/policies/refund-policy'><p>Refunds / Cancellations</p></Link>
                            <Link href='/policies/shipping-policy'><p>Shipping / Delivery Policy</p></Link>
                        </div>
                    </div>
                    <div className='footer-nav'>
                        <h2>Resources</h2>
                        <div className="wrapper-link">
                            {/* <Link href='/'><p>Home</p></Link> */}
                            <Link href='/'><p>Customer</p></Link>
                            <Link href='/seller'><p>Seller</p></Link>
                            {/* <Link href='/blogs'><p>Blogs</p></Link> */}
                            {/* <Link href='/books'><p>Books</p></Link> */}
                            <Link href='/rider'><p>Rider</p></Link>
                        </div>
                    </div>
                    <div className='footer-nav second-footer'>
                        <h2>Contact Us</h2>
                        <a href='' target='_blank'><p><IoLocationSharp size="1.5rem"></IoLocationSharp><span>Ahmedabad, Gujarat, India</span></p></a>
                        <a href='' target='_blank'><p><MdCall size="1.5rem"></MdCall><span>(+91) 87993 34085</span></p></a>
                        <a href='mailto:info@foodboss.in' target='_blank'><p><MdEmail size="1.5rem"></MdEmail><span>info@foodboss.in</span></p></a>

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
                    <h2>All Rights Reserved By Foodboss Retail Private Limited, 2020-2022.</h2>

                </div>
            </div>
        </footer>
    )
}

export default FooterHome
