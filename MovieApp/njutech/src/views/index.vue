<template>
    <el-container>
        <el-header style="margin:0;padding: 0;height: 30px">
            <!--<el-menu mode="horizontal"
                     background-color="#545652"
                     text-color="white"
                     active-text-color="#ffd04b"
                     default-active="/index/"
                     :router="true">
                <el-menu-item index="/index/" >首页</el-menu-item>
                <el-menu-item index="/index/range">排行榜</el-menu-item>
                <el-menu-item index="/index/hot">热门电影</el-menu-item>
            </el-menu>-->
            <div style="background-color: #505458;margin: 0;padding: 0;height: 40px" >

                <!--<el-link href="#" class="toplabel" target="_black"  >{{label}}</el-link>-->
                <el-link href="#" class="toplabel" target="_black"  >豆瓣</el-link>
                <el-link href="#" class="toplabel" target="_black"  >电影</el-link>
                <el-link href="#" class="toplabel"  target="_black"  >音乐</el-link>
                <el-link href="#" class="toplabel" target="_black"  >同城</el-link>
                <el-link href="#" class="toplabel" target="_black"  >小组</el-link>
                <el-link href="#" class="toplabel"  target="_black"  >阅读</el-link>
                <el-link href="#" class="toplabel" target="_black"  >FM</el-link>
                <el-link href="#" class="toplabel"  target="_black"  >时间</el-link>
                <el-link href="#" class="toplabel"  target="_black"  >豆品</el-link>
                <el-link href="#" class="toplabel"  target="_black"  >更多</el-link>
            </div>
        </el-header>
        <el-main style="margin: 0;padding: 0">
            <div class="search-wrapper">
                <el-row>
                    <el-col :span="3" :offset="3" style="margin-left: 135px">
                        <h1 class="logo-title">萝卜电影</h1>
                    </el-col>
                    <el-col :span="9">
                        <el-input placeholder="搜索电影、电视剧、艺人">
                            <el-button slot="append" icon="el-icon-search" style="background-color: #9099A1;color:white"></el-button>
                        </el-input>
                    </el-col>
                    <el-col :span="4" :offset="16" style="position: absolute">
                        <el-image
                                style="width: 100px; height: 80px"
                                :src="imgSrc"></el-image>
                    </el-col>
                </el-row>
                <el-row style="margin-top: 30px;color:#27a">
                    <!--<el-menu :router="true" mode="horizontal" active-text-color="blue" style="color: #f0f3f5;background-color:#f0f3f5 ">
                        <el-menu-item index="/index/range/" >12</el-menu-item>
                        <el-menu-item index="/index/">13</el-menu-item>
                    </el-menu>-->
                    <el-col :span="1" class="lab" >
                        <el-link :underline="false" type="primary" href="/index/">影讯&购票</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px;width: 80px">
                        <el-link :underline="false" type="primary" href="/index/range/">排行榜</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px;width: 80px">
                        <el-link :underline="false" type="primary" href="/index/hot/">热门电影</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px;width: 80px">
                        <el-link :underline="false" type="primary" href="/index/">电视剧</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px;width: 80px">
                        <el-link :underline="false" type="primary" href="/index/">选电影</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px;">
                        <el-link :underline="false" type="primary" href="/index/">分类</el-link>
                    </el-col>
                    <el-col :span="1" style="margin-right: 8px">
                        <el-link :underline="false" type="primary" href="/index/">影评</el-link>
                    </el-col>
                    <el-col :span="2" style="margin-right: 8px">
                        <el-link :underline="false" type="primary" href="/index/">2019年度榜单</el-link>
                    </el-col>
                </el-row>
            </div>
            <router-view/>
        </el-main>
        <el-aside>

        </el-aside>
    </el-container>
</template>

<script>
    export default {
        name: "Index.vue",
        created () {
            //获取一下上一个页面带过来的userId
            this.userId = this.$route.params.userId;
        },
        data () {
            return {
                userId:'',
                imgSrc:require('../assets/logo2.png'),
                labTable:['豆瓣','读书','电影','音乐','同城','小组','阅读','FM','时间','豆品','更多']
            }
        },
        /*watch: {
            '$route' (to, from) {
                // 路由发生变化页面刷新
                this.$router.go(0);
            }
        },*/
    }
</script>


<style scoped>
    .logo-title {
        margin:0;
        height:40px;
        line-height: 40px;
        color:#27a;
    }
    .search-wrapper {
        background-color: #f0f3f5;
        padding: 20px;
    }
    .lab{
        margin-left: 173px;
        margin-right: 15px;
        width: 80px;
    }
    .toplabel{
        color: #cac6c6;
        font-size: 12px;
        margin: 8px;
        float: left;
    }

</style>

