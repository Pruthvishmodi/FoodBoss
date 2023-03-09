
import Layout from '../components/common/Layout'
import '../styles/globals.css'
import NextNProgress from 'nextjs-progressbar';

function MyApp({ Component, pageProps }) {
  return <Layout>
    <NextNProgress color="#F77B54" startPosition={0.3} stopDelayMs={200} height={3} showOnShallow={true} />
    <Component {...pageProps}/>
    </Layout>
}

export default MyApp
