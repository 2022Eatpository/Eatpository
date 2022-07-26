import axios from "axios";

// userid, password 입력 받으면 token 값 return
// error 시, token = '', 성공 시, token = 'Token 값'
const signUpAPI = async (userid:any, password:any,userphone:any) => {
  let token = ''
  await axios.post("http://localhost:8000/users/signup/", {
    user_id: userid,
    password: password,
    phone_number:userphone,
  },{
    withCredentials:true}
  )
  .then((response) => {
    token = response.data.Token;
  })
  .catch(function (error) {
    console.log(error);
  });
  return token;
}

export default signUpAPI;