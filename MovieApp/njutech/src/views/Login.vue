<!--<template>
    <div style="margin-top: 50px">
        <el-image style="width: 100px; height: 100px" :src="url" :fit="scale-down"></el-image>
        <h1>登录</h1>
        <el-row>
            <el-col :span="6" :offset="9">
                <el-input style="width: 400px" v-model="user.username" placeholder="输入用户名"></el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="6" :offset="9">
                <el-input style="width: 400px" v-model="user.password" type="password" placeholder="输入密码"></el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="8" :offset="8">
                <el-button @click="login">登录</el-button>
                <el-button type="danger" @click="clear">清空</el-button>
            </el-col>
        </el-row>
    </div>
</template>-->
<template>
    <div id="poster">
    <el-form class="login-container" label-position="left"
             label-width="0px">
        <h3 class="login_title">萝卜后台登录</h3>
        <el-form-item>
            <el-input type="text" v-model="user.username"
                      auto-complete="off" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item>
            <el-input type="password" v-model="user.password"
                      auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item style="width: 100%">
            <el-button type="primary" style="width: 100%;background: #505458;border: none" v-on:click="login">登录</el-button>
        </el-form-item>
    </el-form>
    </div>
</template>

<script>
    export default {
        name: "Login.vue",
        data (){
            return{
                user:{
                    username:'',
                    password:''
                }
            }
        },
        methods: {
            clear() {
                this.user.username = "";
                this.user.password = "";
            },
            login() {
                /*//在实际开发过程中，这里要发送一个ajax请求到后台，由后台的java服务来访问数据库判断登录是否成功
                let username = this.user.username;
                let password = this.user.password;
                if (username === 'yyw' && password === "111") {
                    //1 获取router路由对象
                    this.$router.push({name: "Index", params: {userId: username}})
                } else {
                    //登录失败，提示登录失败，并且将username和password清空
                    this.$message.error("用户名或密码输入错误，请重新输入！");
                    this.clear();
                }*/
                this.$axios
                    .post('/login', this.user)
                    .then(successResponse => {
                        if (successResponse.data === "login success") {
                            sessionStorage.setItem("islogin", 1);
                            /*console.log(localStorage.getItem("islogin"));*/
                            this.$router.push({name: "Admin", params: {userId: this.user.username}})
                            /*this.$router.replace({path: '/index'})*/
                        }else {
                            this.$message.error("用户名或密码输入错误，请重新输入！");
                            this.clear();
                        }
                    })
                    .catch(failResponse => {
                    })

            }
        }
    }
</script>

<style scoped>
    #poster {
        background: url("../assets/backg.jpg") no-repeat center;
        height: 100%;
        width: 100%;
        background-size: cover;
        position: fixed;
        margin: 0 auto;
    }
    body{
        margin: 0 ;
        padding: 0;
    }

    .login-container {
        border-radius: 15px;
        background-clip: padding-box;
        margin: 90px auto;
        width: 350px;
        padding: 35px 35px 15px 35px;
        background: #fff;
        border: 1px solid #eaeaea;
        box-shadow: 0 0 25px #cac6c6;
    }

    .login_title {
        margin: 0 auto 40px auto;
        text-align: center;
        color: #505458;
    }
</style>
