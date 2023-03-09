import React, { useContext, useEffect,useRef, useState } from 'react';
import Link from 'next/link';
import { AiOutlineMenu, AiOutlineClose, AiOutlineCaretDown } from "react-icons/ai";
import {SidebarData} from './SidebarData'
import { BiSupport } from 'react-icons/bi';

const Header = () => {
  const headerRef = useRef(null);
  useEffect(() => {
    window.addEventListener('scroll', () => {
      headerRef?.current?.classList?.toggle('headerScroll', window.scrollY > 0);
    })
  }, []);

  const [sidebar, setSidebar] = useState(false);
  const [ulOpen, setUlOpen] = useState(false);

  const showSidebar = () => {
    console.log('wesfsfwd'); 
    setSidebar(!sidebar); };

  return (
    <>
      <header className="header z-50 py-1 px-3 bg-transparent fixed top-0 left-0 w-full" ref={headerRef}>
        <div className="n-wrapper max-w-6xl my-0 mx-auto w-full flex items-center justify-between">
          <div className="n-left">
            <a className="logo-header" href="/">
              <img src="/foodboss-white-logo.png" alt="" width={250} height={250} />
              </a>
          </div>


          {/* <div className='navbar-menu lg:hidden bg-black'> */}
          <div className="h-m-menu lg:hidden">
              <AiOutlineMenu fill='white' size={'1.5rem'} onClick={showSidebar}/>
          </div>
           <nav className={`${sidebar?'active':null} nav-menu`}>
            <ul className='nav-menu-items text-white'>
              <li className='navbar-toggle m-4'>
                <AiOutlineClose fill='white' size={'1.5rem'} onClick={showSidebar}/>
              </li>
              {SidebarData.map((item, index) => {
                return (
                  <li key={index} className={item.cName} onClick={showSidebar}>
                    <Link href={item.path} >
                      <p className='menu-p'>{item.icon}<span>{item.title}</span></p>
                    </Link>
                  </li>
                )
              })}
              <li  className={'nav-text flex flex-col items-start'}>
                      <p className='menu-p' onClick={()=>{setUlOpen(prev=>!prev)}}><BiSupport/><span>Support</span></p>
                      {ulOpen? <ul className='flex flex-col items-start pt-2 pl-20 gap-2 text-xl'>
                    <li className='drop-li' onClick={showSidebar}><Link href="/userSupport" className='' >Customer</Link></li>
                    <li className='drop-li' onClick={showSidebar}><Link href="/sellerSupport" className='' >Seller</Link></li>
                    <li className='drop-li' onClick={showSidebar}><Link href="/riderSupport" className='' >Rider</Link></li>
                  </ul>:null}
                  </li>
            </ul>
          </nav>
          {/* </div> */}


          <div className="n-right lg:flex gap-16 hidden items-center">
            <div className="n-list">
              <ul className=" flex gap-12 font-semibold text-white">
                <Link href="/"><li className="menu-text-hover">Home</li></Link>
                <Link href="/seller"><li className="menu-text-hover">Seller</li></Link>
                <Link href="/rider"><li className="menu-text-hover">Rider</li></Link>
                <Link href="/about"><li className="menu-text-hover">About</li></Link>
                <Link href="/blogs-by-foodboss"><li className="menu-text-hover">Press</li></Link>
                <li className="menu-text-hover SupportName flex flex-row items-center gap-1 relative">Support <AiOutlineCaretDown className='drop-icon'/>
                  <ul className='hidden flex-col absolute items-start top-6 left-0 gap-2 bg-black rounded-xl p-3'>
                    <li className='drop-li'><Link href="/userSupport" className=''>Customer</Link></li>
                    <li className='drop-li'><Link href="/sellerSupport" className=''>Seller</Link></li>
                    <li className='drop-li'><Link href="/riderSupport" className=''>Rider</Link></li>
                  </ul>
                </li>
                  
              </ul>
            </div>
            {/* <div className="h-icons flex items-center gap-4">
              <FaYoutube className="menu-text-hover" size={20} />
              <FaFacebookF className="menu-text-hover" size={20} />
              <FaInstagram className="menu-text-hover" size={20} />
            </div> */}
            <a href="https://play.google.com/store/apps/details?id=com.foodboss.user">
              <button className="btn-primary">Download now</button>
            </a>
          </div>
        </div>
      </header>
    </>
  );
};

export default Header;
