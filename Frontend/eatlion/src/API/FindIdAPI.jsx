import axios from "axios";

const FindIdAPI = async (userphone) => {
    let findid ="";
    await axios
    .get("http://localhost:8000/users/user-id/",
       
            {headers:{
        
                userphone}
            
        }
    ,{withCredentials:true,})
    .then((response)=>{
        findid = response.data.data;
    }) 
    .catch(function(error){
        console.error(error);
    });
    return findid
};

export default FindIdAPI;