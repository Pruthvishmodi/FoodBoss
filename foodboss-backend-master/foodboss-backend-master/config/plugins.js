module.exports = ({ env }) => ({
    upload: {
      config: {
        provider: "strapi-provider-upload-imagekit",  // Community providers need to have the full package name
        providerOptions: {
          publicKey: "public_Sbfr9/NzzAEKPe+6OF5qYYKJ2Hc=",
          privateKey: "private_nvBESOOoVLEvUBcNIM5kIpi3UdM=",
          urlEndpoint: "https://ik.imagekit.io/gffoprih5b", 
          // Optional
          params: {
            folder: "/production/images"  // Defaults to "/" if value is not supplied
          }
        }
      }
    }
  });