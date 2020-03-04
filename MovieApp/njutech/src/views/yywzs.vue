<template>
    <div id="app">
        <el-container>
            <el-header>
                <el-menu  mode="horizontal" >
                    <el-menu-item index="">萝卜后台</el-menu-item>
                   <!-- <el-submenu index="2">
                        <template slot="title">我的工作台</template>
                        <el-menu-item index="2-1">选项1</el-menu-item>
                        <el-menu-item index="2-2">选项2</el-menu-item>
                        <el-menu-item index="2-3">选项3</el-menu-item>
                        <el-submenu index="2-4">
                            <template slot="title">选项4</template>
                            <el-menu-item index="2-4-1">选项1</el-menu-item>
                            <el-menu-item index="2-4-2">选项2</el-menu-item>
                            <el-menu-item index="2-4-3">选项3</el-menu-item>
                        </el-submenu>
                    </el-submenu>-->

                    <el-menu-item >
                        <el-col :span="1" class="grid">
                            <el-button type="success" icon="el-icon-circle-plus-outline" size="mini" round @click="addRow">新增</el-button>
                        </el-col>
                    </el-menu-item>
                </el-menu>
            </el-header>

            <el-main>
                <el-table :data="movieList" class="tb-edit" style="width: 100%" highlight-current-row >

                    <!--<el-table-column class="row1" width="0">
                        <template scope="scope" style="width: 0;height: 0px">
                            <label style="width: 0" v-model="scope.row.id" placeholder="请输入内容" > </label>
                        </template>
                    </el-table-column>-->
                    <el-table-column label="片名" width="150">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.name" placeholder="请输入内容" ></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column prop="date" label="上映时间" width="200">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.time" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="演员" width="100">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.actor" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="评分" width="100">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.score" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="地区" width="100">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.area" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="热度" width="100">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.heat" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="类型">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.kind" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="海报">
                        <template scope="scope">
                            <el-input size="small" v-model="scope.row.imgSrc" placeholder="请输入内容"></el-input>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作" width="180px">
                        <template scope="scope">
                            <!--<el-button size="small" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>-->
                            <el-button size="small" type="primary" @click="handleUpdate(scope.$index, scope.row)" >保存</el-button>
                            <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)" >删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>

            </el-main>
            <el-footer>

            </el-footer>
        </el-container>


        </div>

</template>

<script>
    export default {
        name: "yywzs",
        data(){
            return{
                movieList:'',
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
                        this.movieList=successResponse.data;
                        console.log(this.movieList)
                    })
            },
            addRow () {
                this.movieList.push({
                    actor: '',
                    actorImg: '',
                    area: '',
                    heat:'',
                    imgSrc:'',
                    kind: '',
                    name:'',
                    score:'',
                    time:''
                })
            },
            /*handleCurrentChange(row, event, column) {
                console.log(row, event, column, event.currentTarget)
            },
            handleEdit(index, row) {
                console.log(index, row);
            },*/
            handleUpdate(index, row) {
                console.log(index,row);
                row.id=this.movieList[index].id;
                this.$axios
                    .post('/updatemovie',row)
                    .then(successResponse =>{
                        this.$message.success("修改成功")
                    })
            },
            handleDelete(index, row) {
                console.log(index,row);
                row.id=this.movieList[index].id;
                this.$axios
                    .post('/deletemovie',row)
                    .then(successResponse =>{
                        this.$message.success("删除成功")
                    })
                this.$router.go(0);
            }
        },
    };
</script>

<style scoped>
    .row1{
        display: inline-block;
        margin: 0;
        padding: 0;

    }
</style>
