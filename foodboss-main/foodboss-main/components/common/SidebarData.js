import React from 'react';
import {AiFillHome, AiFillShop} from 'react-icons/ai';
import {RiEBikeFill, RiTeamFill} from 'react-icons/ri';
import {FaThumbsUp} from 'react-icons/fa';
import {BiNews, BiSupport} from 'react-icons/bi';

export const SidebarData = [
    {
        title: 'Home',
        path: '/',
        icon: <AiFillHome/>,
        cName: 'nav-text'
    },
    {
        title: 'Seller',
        path: '/seller',
        icon: <AiFillShop/>,
        cName: 'nav-text'
    },
    {
        title: 'Rider',
        path: '/rider',
        icon: <RiEBikeFill/>,
        cName: 'nav-text'
    },
    {
        title: 'About',
        path: '/about',
        icon: <RiTeamFill/>,
        cName: 'nav-text'
    },
    {
        title: 'Press',
        path: '/blogs-by-foodboss',
        icon: <BiNews/>,
        cName: 'nav-text'
    },
    // {
    //     title: 'Support',
    //     path: '/support',
    //     icon: <BiSupport/>,
    //     cName: 'nav-text'
    // },
]