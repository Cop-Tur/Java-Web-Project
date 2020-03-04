<template>
    <div style="text-align: center;">
        <el-container>
            <el-aside style="position: absolute;margin-left: 1000px;margin-top: 50px">
                <div style="background-color: #f2f7f6;width:280px;height: 40px">
                    <span style="position:relative;color:#27a;float: left;margin-top:10px;margin-left: 10px;font-size: 14px">豆瓣电影评分八词</span>
                </div>
                <el-table
                        :data="movieList"
                        style="width: 100%;margin-top: 20px"
                        stripe>
                    <el-table-column prop="name" width="280" :render-header="renderHeader">
                        <template scope="scope">
                            <!--<el-input size="small" v-model="scope.row.area" placeholder="请输入内容"></el-input>-->
                            <span style="font-size: 13px;">{{scope.$index+1}} </span>
                            <el-link :underline="false" type="primary" href="/index/" style="font-size: 13px;">{{scope.row.name}}</el-link>
                        </template>
                    </el-table-column>
                </el-table>
            </el-aside>

            <el-main style="margin-right: 300px">
                <div class="hot-wrapper" >
                    <h2>萝卜电影排行榜</h2>
                    <h4 style="color: #007722">萝卜新片榜 · · · · · ·</h4>
                </div>
                <div class="range-wrapper">
                    <ul>
                        <li v-for="movie in sortMovies" :key="movie.movieId">
                            <el-container>
                                <el-aside width="90px"><img class="movie-profile" :src="movie.imgSrc" /></el-aside>
                                <el-container>
                                    <!--<el-header>{{movie.movieName}}</el-header>-->
                                    <el-header height="90px">
                                        <el-link style="font-size: 15px; display: inline-block;margin-bottom: 13px" >{{movie.name}}</el-link><br>
                                        <span style="font-size: 13px">{{movie.time}}({{movie.area}})  / {{movie.actor}} </span>
                                        <span style="font-size: 13px" v-for="n in 35"> / {{movie.actor}}  </span><br>

                                    </el-header>
                                    <el-footer height="35px" style="margin-top: 15px">
                                        <el-rate :value="movie.score/2" disabled style="display: inline-block"></el-rate>
                                        <span style="font-size: 13.5px;">{{movie.score}}</span>
                                    </el-footer>
                                </el-container>
                            </el-container>
                        </li>
                    </ul>
                </div>
            </el-main>

        </el-container>


    </div>
</template>

<script>
    export default {
        name: "Range.vue",
        data () {
            return {
                movieList:null,
                sortMovies:''
            }
        },
        methods:{
            findAll(){
                this.$axios
                    .post('/findall')
                    .then(successResponse =>{
                        /*console.log(successResponse.data)*/
                        this.movieList=successResponse.data;
                        for (var i=0;i<this.movieList.length;i++){
                            this.movieList[i].imgSrc=require('../assets/'+this.movieList[i].imgSrc)
                        }
                        this.sortMovies=JSON.parse(JSON.stringify(this.movieList));
                        console.log(this.movieList);
                    })
            },
            renderHeader (h,{column}) { // h即为cerateElement的简写，具体可看vue官方文档
                return h(
                    'div',
                    [
                        h('span', {
                            style: "font-size:18px;color:black;font-weight: lighter"
                        },'一周口碑榜'),
                        h('i', {
                            class:'el-icon-video-camera-solid',
                            style:'color:#409eff;margin-left:10px;font-size:20px'
                        })
                    ],
                );
            }
        },
        created () {
            this.findAll()
        },
        watch:{
            movieList:{
                handler(){
                    /*this.findAll()*/
                    this.sortMovies=sortByKey(this.sortMovies,'heat');
                    console.log(this.sortMovies)
                },
                deep:true
            }
        },
        /*computed:{
            sortMovies:function(){
                return sortByKey(this.movieList,'heat');
            }
        }*/

    }
    function sortByKey(array,key) {
        return array.sort(function(a,b){
            var x=a[key];
            var y=b[key];
            return ((x>y)?-1:((x<y)?1:0));
        });
    }

</script>

<style scoped>
    .hot-wrapper {
        text-align: left;
        width: 800px;
        display: inline-block;
        border-bottom: 1px solid  lightgrey;
    }
    .range-wrapper{
        text-align: left;
        width: 800px;
        display: inline-block;
    }
    ul {
        list-style-type: none ;/*清除样式*/
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    li{
        padding: 0;
        display: block;
        margin: 20px 0 20px 0;
        border-bottom: 1px solid  lightgrey;
    }
    .movie-profile{
        width: 80px;
        height: 120px;
        /*display: inline-block;*/
    }
    .el-head {
        color: #333;
        line-height: 120px;

    }



</style>
