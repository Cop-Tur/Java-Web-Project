<template>
    <el-container>
        <el-aside style="position: absolute;margin-left: 1000px;margin-top: 50px">
            <div style="background-color: #f2f7f6;width:280px;height: 40px">
                <span style="position:relative;color:#27a;float: left;margin-top:10px;margin-left: 10px;font-size: 14px">豆瓣电影评分八词</span>
            </div>
            <!--<el-button>豆瓣电影评分八词</el-button>-->
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
            <div style="text-align: center;">
                <div class="hot-wrapper" >
                    <h2>选电影</h2>
                </div>

                <div>

                    <div class="sort">
                        <label>
                            <input type="radio" name="sort" value="recommend" checked="checked" @click="sortT('heat')">按热度排序
                        </label>
                        <label>
                            <input type="radio" name="sort" value="time" @click="sortT('time')">按时间排序
                        </label>
                        <label>
                            <input type="radio" name="sort" value="rank" @click="sortT('score')">按评价排序
                        </label>
                    </div>
                </div>

                <div class="hot-movie">
                    <ul>
                        <li v-for="movie in sortList" :key="movie.id">
                            <img class="movie-profile" :src="movie.imgSrc"/>
                            <div class="movie-message">
                                <span class="movie-title">{{movie.name}}</span>
                                <span class="score">{{movie.score}}</span>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </el-main>
    </el-container>
</template>

<script>
    export default {
        name: "Hot",
        data () {
            return {
                movieList: null,
                sortList:'',
                hotList:'',
                scoreList:'',
            }
        },
        mounted:function(){
            this.findAll()
        },
        methods:{
            findAll(){
                this.$axios
                    .post('/findall')
                    .then(successResponse =>{
                        console.log(successResponse.data)
                        this.movieList=successResponse.data;
                        for (var i=0;i<this.movieList.length;i++){
                            this.movieList[i].imgSrc=require('../assets/'+this.movieList[i].imgSrc)
                        }
                        this.sortList=JSON.parse(JSON.stringify(this.movieList));
                        /*this.hotList=JSON.parse(JSON.stringify(this.movieList));
                        this.scoreList=JSON.parse(JSON.stringify(this.movieList));*/
                        console.log(this.movieList);
                    })
            },
            /*hotSort(){
                this.sortList=this.hotList
            },
            scoreSort(){
                this.sortList=this.scoreList
            },*/
            sortT(key){
                this.sortList=sortByKey(this.sortList,key)
            },

            renderHeader (h,{column}) { // h即为cerateElement的简写
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
        /*watch:{
            movieList:{
                handler(){
                    /!*this.findAll()*!/
                    this.hotList=sortByKey(this.hotList,'heat');
                    this.scoreList=sortByKey(this.scoreList,'score')
                },
                deep:true
            }
        },*/
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
        margin-top: 0;
        border-bottom: 1px solid  lightgrey;
    }
    .sort {
        float: left;
        padding-left: 175px;
        margin-top: 10px;
        display: inline-block;
        color: #666;
        font-size: 13px;
    }
    .hot-movie{
        text-align: left;
        width: 800px;
        display: inline-block;
        margin-top: 30px;
    }

    .movie-message{
        text-align: center;
        margin-bottom: 10px;
    }

    ul {
        list-style-type: none ;/*清楚样式*/
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    li{
        padding: 0;
        float:left;
        margin: 0 15px 0 0;
    }

    .movie-profile{
        width: 135px;
        height: 200px;
    }

    .movie-title{
        display: inline-block;
        width: 70px;
        height: 21px;
    }

    .score{
        color:#e09015;
    }

</style>
