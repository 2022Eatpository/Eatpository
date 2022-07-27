import axios from "axios";

// userid, password 입력 받으면 token 값 return
// error 시, token = '', 성공 시, token = 'Token 값'
const LogInAPI = async (userid, password) => {
  let token = "";
  await axios
    .post("https://postman-echo.com/POST", {
      userid: userid,
      password: password,
    })
    .then((response) => {
      token = response.data.Token;
    })
    .catch(function (error) {
      console.log(error);
    });
  return token;
};

export default LogInAPI;