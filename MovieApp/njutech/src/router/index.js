import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter);

const routes = [
  {
    path: "/login",
    name: "Login",
    component: ()=>import("../views/Login")
  },
  {
    path: "/yywzs",
    name: "Admin",
    meta: { // 在路由配置中加入meta:{requireAuth: true}
      requireAuth: true
    },
    component: ()=>import("../views/yywzs")
  },
  /*{
    path: "/hot",
    name: "Hot",
    component: ()=>import("../views/Hot")
  },*/
  {
    path: "/index",
    name: "Index",
    component:()=>import("../views/index"),
    children:[
      {
        path:"/index/",
        name: "IndexPage",
        component:()=> import('../views/IndexPage')
      },
      {
        path:"/index/range",
        name: "Range",
        component:()=> import('../views/Range')
      },
      {
        path:"/index/hot",
        name: "Hot",
        component:()=> import('../views/Hot')
      },
    ]
  }

];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

export default router


router.beforeEach((to, from, next) => {
  let islogin = sessionStorage.getItem("islogin");
  islogin = Boolean(Number(islogin));

  if(to.path == "/login"){
    if(islogin){
      next("/yywzs");
    }else{
      next();
    }
  }else{
    // requireAuth:可以在路由元信息指定哪些页面需要登录权限
    if(!to.meta.requireAuth || islogin) {
      next();
    }else{
      next("/login");
    }
  }
})
