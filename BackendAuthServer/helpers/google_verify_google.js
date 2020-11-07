const {OAuth2Client} = require('google-auth-library');

const CLIENT_ID="715024918126-dj1oro3i2s1n29o1g5tg101nheclvb9g.apps.googleusercontent.com";

const client = new OAuth2Client(CLIENT_ID);

const validarGoogleIdToken = async (token)=>{
    try {
        const ticket = await client.verifyIdToken({
            idToken: token,
            audience: [CLIENT_ID,
                "715024918126-j6lc1i35j2emb1s8vsrn825c96me1i94.apps.googleusercontent.com",
            ],  // Specify the CLIENT_ID of the app that accesses the backend
            // Or, if multiple clients access the backend:
            //[CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3]
        });
        const payload = ticket.getPayload();
        console.log(payload);
        const userid = payload['sub'];
        // If request specified a G Suite domain:
        // const domain = payload['hd'];
        return{
            name:payload["name"],
            picture:payload["picture"],
            email:payload["email"],
    
        }
    } catch (error) {
        return null;
    }
}

module.exports={
    validarGoogleIdToken
}