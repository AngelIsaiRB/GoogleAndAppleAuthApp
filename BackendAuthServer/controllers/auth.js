
const { response } = require("express");

const {validarGoogleIdToken} = require("../helpers/google_verify_google");

const googleAuth =async  (req, res = response )=>{

     const token= req.body.token;
     if(!token){
         return res.json({
             ok:false,
             msg:"no hay token"
         });
     }
    const googleUser = await validarGoogleIdToken(token);
    if(!googleUser){
        return res.status(400).json({
            ok:false
        });
    }
    //guardar en la DB
    res.json({
        ok:true,
        googleUser
    });


}

module.exports={
    googleAuth
}