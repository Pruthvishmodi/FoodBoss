import Document, { Html, Head, Main, NextScript } from 'next/document'

class MyDocument extends Document {
  
  render() {
    return (
      <Html lang="en">
        <Head>
        <meta charSet="utf-8"/>
        <meta name="author" content="Neel Bhalodiya"/>
        <meta property="og:type" content="website" />
        <meta property="og:title" content="Food Boss" />
        <meta property="og:description" content="Grocery Ka Boss." />
        {/* <meta property="og:image" content="" /> */}
        <meta property="og:url" content="foodboss.in" />
        <meta property="og:site_name" content="Food Boss" />

        <meta name="application-name" content="Food Boss" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="default" />
        <meta name="apple-mobile-web-app-title" content="Food Boss" />
        <meta name="description" content="Grocery Ka Boss." />
        <meta name="format-detection" content="telephone=no" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="msapplication-tap-highlight" content="no" />
      <link rel="apple-touch-icon" href="/apple-icon.png" />
      {/* <link rel="icon" type="image/png" sizes="32x32" href="/logo32.png" />
      <link rel="icon" type="image/png" sizes="194x194" href="/logo194.png" />
      <link rel="icon" type="image/png" sizes="192x192" href="/logo192.png" />
      <link rel="icon" type="image/png" sizes="16x16" href="/logo16.png" /> */}
      {/* <link rel="mask-icon" href="/logo192.png" color="#5bbad5" />
      <meta name="msapplication-TileColor" content="#00aba9" />
      <meta name="msapplication-TileImage" content="/logo144.png" />
      <meta name="theme-color" content="#ffffff" /> */}

      {/* <link rel="shortcut icon" href="/favicon.ico" />

      <meta name="twitter:card" content="summary" />
      <meta name="twitter:url" content="9thsight.com" />
      <meta name="twitter:title" content="9th Sight" />
      <meta name="twitter:description" content="Take your business to the next level with 9th Sight." />
      <meta name="twitter:image" content="/logo-01.png" />
      <meta name="twitter:creator" content="@hardiklalka" />
      <link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Yeseva+One&display=swap" rel="stylesheet" /> */}
        <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png" />
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png" />
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png" />
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
<link rel="manifest" href="/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png" />
<meta name="theme-color" content="#000"></meta>
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    )
  }
}

export default MyDocument